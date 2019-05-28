import 'package:flutter/material.dart';

class VoiceViewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("语音"),
      ),
      body: SizedBox(
        width: 100,
        height: 50,
        child: Card(
          color: Colors.red,
          child: Text("nihap",textAlign: TextAlign.center,style: TextStyle(fontSize: 20),),
        ),
      ),
    );
  }
}
