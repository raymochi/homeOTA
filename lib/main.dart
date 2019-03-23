import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:speech_recognition/speech_recognition.dart';

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

  Set<Marker> markers = new Set.from([
    Marker(
      markerId: MarkerId('1'),
      position: LatLng(43.66014526, -79.37840775),
      icon: BitmapDescriptor.defaultMarker,
      infoWindow: InfoWindow(
        title: 'St. Vincent De Paul - Mary\'s Home',
        snippet: '5 Star Rating',
      )
    )
  ]);

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
  String transscription = '';

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
    _speech.setRecognitionResultHandler((String text) => setState(() => transscription = text));
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this._finishedRecording ? 'Signature' : 'Recording..'),
      ),
      body: this._finishedRecording ? 
        SignatureScreen(
          closeModal: () => Navigator.pop(context),
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
  final VoidCallback closeModal;

  SignatureScreen({ this.closeModal });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white
      ),
      constraints: BoxConstraints.expand(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16.0),
            child: FloatingActionButton(
              onPressed: this.closeModal,
              child: Icon(Icons.check),
            )
          ),
        ],
      )
    );
  }
}
