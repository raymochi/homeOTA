import 'dart:async';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:speech_recognition/speech_recognition.dart';
import 'marker_set.dart';
import 'package:flutter_signature_pad/flutter_signature_pad.dart';
import 'dart:convert';

void main() => runApp(MaterialApp(
  title: 'homeOTA',
  home: HomeScreen(),
));

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Completer<GoogleMapController> _controller = Completer();

  static const LatLng _center = const LatLng(43.646343, -79.383252);

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  void _openAudioRecording(context) {
    Navigator.push(context, MaterialPageRoute<Null>(
      builder: (BuildContext context) {
        return Modal();
      },
      fullscreenDialog: true,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('homeOTA'),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 15.0,
        ),
        markers: markers,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.mic),
        onPressed: () => this._openAudioRecording(context),
      ),
    );
  }
}

class Modal extends StatefulWidget {
  @override
  _ModalState createState() => _ModalState();
}

class _ModalState extends State<Modal> {
  SpeechRecognition _speech;
  bool _finishedRecording = false;
  bool _speechRecognitionAvailable = false;
  bool _isListening = false;
  String transcription = '';
  final _sign = GlobalKey<SignatureState>();

  @override
  void initState() {
    super.initState();
    activateSpeechRecognizer();
  }

  void start() => _speech
    .listen(locale: 'en_US')
    .then((result) => print('_MyAppState.start => result $result'));

  void onSpeechAvailability(bool result) {
    print('speech available!');
    setState(() => _speechRecognitionAvailable = result);
    start();
  }

  void activateSpeechRecognizer() {
    print('_ModalState.activateSpeechRecognizer... ');
    _speech = new SpeechRecognition();
    _speech.setAvailabilityHandler(onSpeechAvailability);
    // _speech.setCurrentLocaleHandler(onCurrentLocale);
    _speech.setRecognitionStartedHandler(() => setState(() => _isListening = true));
    _speech.setRecognitionResultHandler((String text) => setState(() => transcription = text));
    _speech.setRecognitionCompleteHandler(() => setState(() => _isListening = false));
    _speech
      .activate()
      .then((res) => setState(() {
        print('speect activated! $res');
        _speechRecognitionAvailable = res;
        start();
      }));
  }

  void onFinishedRecording() {
    _speech.stop().then((result) {
      setState(() {
        _isListening = result;
        _finishedRecording = true;
      });
    });
  }

  void submit () async {
    final signed = _sign.currentState;
    print(signed);
    final image = await signed.getData();
    final data = await image.toByteData(format: ui.ImageByteFormat.png);

    final encoded = base64.encode(data.buffer.asUint8List());

    print('encoded sig: $encoded');
    print('transcription: $transcription');
    
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this._finishedRecording ? 'Signature' : 'Recording..'),
      ),
      body: this._finishedRecording ? 
        SignatureScreen(
          submit: submit,
          sign: _sign
        ) :
        RecordScreen(
          onFinishRecording: onFinishedRecording,
        )
    );
  }
}

class RecordScreen extends StatelessWidget {
  final VoidCallback onFinishRecording;

  RecordScreen({ this.onFinishRecording });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white
      ),
      constraints: BoxConstraints.expand(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Spacer(),
          Icon(Icons.record_voice_over),
          Spacer(),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              
              children: <Widget>[
                FloatingActionButton(
                  child: Icon(Icons.check),
                  onPressed: () => this.onFinishRecording(),
                )
              ],
            )
          )
        ],
      ),
    );
  }
}

class SignatureScreen extends StatelessWidget {
  final VoidCallback submit;
  final sign;

  SignatureScreen({ this.submit, this.sign });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white
      ),
      constraints: BoxConstraints.expand(),
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  child: Padding(
                    padding:EdgeInsets.all(2.0),
                    child: Signature(
                      color: Colors.blue,
                      strokeWidth: 3.0,
                      key: sign,
                      backgroundPainter: _WatermarkPaint('2.0', '2.0'),
                    ),
                  )
                )
              ),
            ],
          ),
          Positioned(
            bottom: 16.0,
            right: 16.0,
            left: 16.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FloatingActionButton(
                  onPressed: () => this.sign.currentState.clear(),
                  child: Icon(Icons.clear),
                  backgroundColor: Colors.redAccent,
                ),
                FloatingActionButton(
                  onPressed: this.submit,
                  child: Icon(Icons.check),
                )
              ]
            )
          ),
        ]
      )
    );
  }
}

class _WatermarkPaint extends CustomPainter {
  final String price;
  final String watermark;

  _WatermarkPaint(this.price, this.watermark);

  @override
  void paint(ui.Canvas canvas, ui.Size size) {}

  @override
  bool shouldRepaint(_WatermarkPaint oldDelegate) {
    return oldDelegate != this;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is _WatermarkPaint && runtimeType == other.runtimeType && price == other.price && watermark == other.watermark;

  @override
  int get hashCode => price.hashCode ^ watermark.hashCode;
}
