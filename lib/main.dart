import 'dart:async';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:speech_recognition/speech_recognition.dart';
// import 'marker_set.dart';
import 'package:flutter_signature_pad/flutter_signature_pad.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:dio/dio.dart' as DIO;

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
  bool _loading = false;
  bool _showAlert = false;
  static const LatLng _center = const LatLng(43.646343, -79.383252);

  double _capacity = 0.0;

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

  void _getCapacity(String postal) async {
    setState(() => _loading = true);
    final Response res = await post(
      'CAPACITY_ENDPOINT',
      body: json.encode({
        "Inputs": {
          "input1": [
            {
                "SHELTER_POSTAL_CODE": "$postal",
                "SECTOR": "Co-ed",
                "Mean Temp (°C)": "-15",
                "Total Precip (mm)": "16",
                "Snow on Grnd (cm)": "14",
                "Divide(OCCUPANCY_CAPACITY)": 1
            }
          ]
        },
        "GlobalParameters": {}
      }),
      headers: {
        'Authorization': 'CAPACITY_TOKEN'
      }
    );
    print(res.statusCode);
    print(jsonDecode(res.body));
    final decodedRes = jsonDecode(res.body);
    print(decodedRes['Results']['output1'][0]['Scored Label Mean']);
    setState(() {
      _capacity = double.parse(decodedRes['Results']['output1'][0]['Scored Label Mean']);
      _showAlert = true;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('homeOTA'),
      ),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 15.0,
            ),
            markers: new Set.from([
              Marker(
                markerId: MarkerId('h1'),
                position: LatLng(43.646343, -79.384252),
                icon: BitmapDescriptor.fromAsset('assets/person-icon.png'),
              ),

              Marker(
                markerId: MarkerId('h2'),
                position: LatLng(43.643343, -79.388252),
                icon: BitmapDescriptor.fromAsset('assets/person-icon.png'),
              ),

              Marker(
                markerId: MarkerId('h3'),
                position: LatLng(43.646243, -79.383252),
                icon: BitmapDescriptor.fromAsset('assets/person-icon.png'),
              ),

              Marker(
                markerId: MarkerId('h4'),
                position: LatLng(43.647343, -79.384252),
                icon: BitmapDescriptor.fromAsset('assets/person-icon.png'),
              ),

              Marker(
                markerId: MarkerId('h5'),
                position: LatLng(43.643143, -79.383652),
                icon: BitmapDescriptor.fromAsset('assets/person-icon.png'),
              ),

              Marker(
                markerId: MarkerId('h6'),
                position: LatLng(43.646943, -79.386752),
                icon: BitmapDescriptor.fromAsset('assets/person-icon.png'),
              ),

              Marker(
                markerId: MarkerId('7'),
                position: LatLng(43.65205191, -79.39147427),
                icon: BitmapDescriptor.defaultMarker,
                infoWindow: InfoWindow(
                  title: 'University Settlement - Part time Shelter',
                  snippet: '23 Grange Rd',
                ),
                onTap: () {
                  _getCapacity('M5T 1C3');
                }
              ),

              Marker(
                markerId: MarkerId('3'),
                position: LatLng(43.64874717, -79.39323797),
                icon: BitmapDescriptor.defaultMarker,
                infoWindow: InfoWindow(
                  title: 'Streets to Homes Assessment & Referral Centre',
                  snippet: '129 Peter St',
                ),
                onTap: () {
                  _getCapacity('M5V 2H3');
                }
              ),

              Marker(
                markerId: MarkerId('11'),
                position: LatLng(43.64818818, -79.39800551),
                icon: BitmapDescriptor.defaultMarker,
                infoWindow: InfoWindow(
                  title: 'YMCA House',
                  snippet: '485 Queen St W',
                ),
                onTap: () {
                  _getCapacity('M5V 2A9');
                }
              ),

              Marker(
                markerId: MarkerId('53'),
                position: LatLng(43.6411163, -79.40267349),
                icon: BitmapDescriptor.defaultMarker,
                infoWindow: InfoWindow(
                  title: 'Seaton House/Fort York',
                  snippet: '38 Bathurst St',
                ),
                onTap: () {
                  _getCapacity('M5V 3W3');
                }
              ),

              Marker(
                markerId: MarkerId('22'),
                position: LatLng(43.65950349, -79.38143531),
                icon: BitmapDescriptor.defaultMarker,
                infoWindow: InfoWindow(
                  title: 'Covenant House',
                  snippet: '20 Gerrard St E',
                ),
                onTap: () {
                  _getCapacity('M5B 2P3');
                }
              ),

              Marker(
                markerId: MarkerId('0'),
                position: LatLng(43.66014526, -79.37840775),
                icon: BitmapDescriptor.defaultMarker,
                infoWindow: InfoWindow(
                  title: 'St. Vincent De Paul - Mary\'s Home',
                  snippet: '70 Gerrard St E',
                ),
                onTap: () {
                  _getCapacity('M5B 1G6');
                }
              ),

              Marker(
                markerId: MarkerId('50'),
                position: LatLng(43.65995605, -79.37426518),
                icon: BitmapDescriptor.defaultMarker,
                infoWindow: InfoWindow(
                  title: 'Seaton House Main Site',
                  snippet: '339 George St',
                ),
                onTap: () {
                  _getCapacity('M5A 2N2');
                }
              ),

              Marker(
                markerId: MarkerId('33'),
                position: LatLng(43.65230693, -79.37396099),
                icon: BitmapDescriptor.defaultMarker,
                infoWindow: InfoWindow(
                  title: 'Fred Victor Centre - Women\'s Shelter',
                  snippet: '86 Lombard St',
                ),
                onTap: () {
                  _getCapacity('M5C 1M3');
                }
              ),

              Marker(
                markerId: MarkerId('46'),
                position: LatLng(43.6523228, -79.37247726),
                icon: BitmapDescriptor.defaultMarker,
                infoWindow: InfoWindow(
                  title: 'Salvation Army - Gateway',
                  snippet: '107 Jarvis St',
                ),
                onTap: () {
                  _getCapacity('M5C 2H4');
                }
              ),
            ]),
          ),
          this._loading ? Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(100, 100, 100, 0.3),
            ),
            child: Center(
              child: CircularProgressIndicator(
                value: null,
              )
            )
          ) : Container(),
          this._showAlert ?
          AlertDialog(
            title: Text('Available Capacity'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('${((_capacity * 100.0).round())}%'),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('OK'),
                onPressed: () {
                  setState(() => _showAlert = false);
                },
              )
            ],
          ) : Container(),
        ],
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
  bool _loading = false;
  bool _showAlert = false;
  Map _processedData = {};

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
    // setState(() => _loading = true);
    _speech.stop().then((result) {
      setState(() {
        _isListening = result;
        _finishedRecording = true;
        // _loading = false;
      });
    });
  }

  void submit () async {
    final signed = _sign.currentState;
    print(signed);
    final image = await signed.getData();
    final data = await image.toByteData(format: ui.ImageByteFormat.png);
    setState(() => _loading = true);

    // final punctuationRequest = new StreamedRequest('POST', Uri.parse('http://bark.phon.ioc.ee/punctuator'));
    // punctuationRequest.fields['text'] = transcription;
    final dio = DIO.Dio();
    dio.options.baseUrl = 'http://bark.phon.ioc.ee/';
    DIO.FormData formData = new DIO.FormData.from({
      'text': transcription
    });

    final puntuatedTranscriptResponse = await dio.post(
      '/punctuator',
      data: formData
    );
    final punctuatedtranscript = puntuatedTranscriptResponse.toString();
    final encoded = base64.encode(data.buffer.asUint8List());
    final List<String> sentences = punctuatedtranscript.split('.');
    final List<String> phrases = punctuatedtranscript.split(new RegExp(r'[\.,]|( and )|( or )|( then )|( but )'));
    final trans = [ punctuatedtranscript ];
    final List lines = [trans, sentences, phrases].expand((x) => x).toList();

    final Map profile = {
      "LengthHomeless": '',
      "Introduction": '',
      "PastOccupation": '',
      "WhatSick": '',
      "WhatSkills": ''
    };

    final Map intentToEntity = {
      "LengthHomeless": 'builtin.number',
      "Introduction": 'builtin.personName',
      "PastOccupation": 'Job',
      "WhatSick": 'Illness',
      "WhatSkills": 'Skills'
    };

    for (String line in lines) {
      final Response result = await post(
        'NLP_ENDPOINT',
        body: '"$line"',
        headers: {
          'Content-Type': 'application/json'
        }
      );
      final fRes = jsonDecode(result.body);
      if (fRes['topScoringIntent'] == null) continue;
      final intent = fRes['topScoringIntent']['intent'];
      // print(intentToEntity[intent]);
      // print(fRes);
      final entityIndex = fRes['entities'].where((e) => e['type'] == intentToEntity[intent]).toList();
      if (entityIndex.length == 0) continue;
      final entity = entityIndex[0];
      // print(entity);
      // profile[intent] = new List.from(profile[intent])..addAll(fRes['entities'].map((e) => e['entity']));
      profile[intent] = entity['entity'];
    }

    print(profile);
    _processedData = profile;

    print('encoded sig: $encoded');
    print('transcription: $punctuatedtranscript');
    final Response response = await post(
      'PROCESSDATA_IMAGE_ENDPOINT',
      body: json.encode({
        'text' : 'punctuatedtranscript',
        'image': encoded,
        'geolocation': '[43.646343, -79.383252]'
      })
    );
    print(response.statusCode);
    print(response.body);
    final sigMappedTo = jsonDecode(response.body);
    _processedData['sigMappedTo'] = sigMappedTo['name'];
    setState(() {
      _loading = false;
      _showAlert = true;
    });
    // Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this._finishedRecording ? 'Signature' : 'Recording..'),
      ),
      body: Stack(
        children: <Widget>[
          this._finishedRecording ? 
          SignatureScreen(
            submit: submit,
            sign: _sign
          ) :
          RecordScreen(
            onFinishRecording: onFinishedRecording,
            transcription: transcription,
          ),
          this._loading ? Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(100, 100, 100, 0.3),
            ),
            child: Center(
              child: CircularProgressIndicator(
                value: null,
              )
            )
          ) : Container(),
          this._showAlert ?
          AlertDialog(
            title: Text('Response'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('Name: ${_processedData['Introduction']}'),
                  Text('Years homeless: ${_processedData['LengthHomeless']}'),
                  Text('Previous Occupation: ${_processedData['PastOccupation']}'),
                  Text('Medical conditions: ${_processedData['WhatSick']}'),
                  Text('Skills: ${_processedData['WhatSkills']}'),
                  Text('Signature mapped to: ${_processedData['sigMappedTo']}'),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Done'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          ) : Container(),
        ]
      )
    );
  }
}

class RecordScreen extends StatelessWidget {
  final VoidCallback onFinishRecording;
  final String transcription;

  RecordScreen({ this.onFinishRecording, this.transcription });

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
          Padding(
            padding: EdgeInsets.all(12.0),
            child: Icon(Icons.record_voice_over)
          ),
          Text(
            this.transcription.split(' ').last,
            style: TextStyle(fontSize: 24.0)
          ),
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
                  heroTag: 'clearButton',
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
