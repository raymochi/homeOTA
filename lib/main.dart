import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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
  bool _finishedRecording = false;

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
          onFinishRecording: () => setState(() => this._finishedRecording = true),
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
