import 'package:flutter/material.dart';


class AboutScreenView extends StatefulWidget {
  @override
  _AboutScreenViewState createState() => _AboutScreenViewState();
}

class _AboutScreenViewState extends State<AboutScreenView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
        children: <Widget>[
          ClipOval(
            child: Icon(
              Icons.settings,
              size: MediaQuery.of(context).padding.top,
            ),
          ),
          ClipOval(
            child: Icon(
              Icons.photo_camera,
              size: MediaQuery.of(context).padding.top,
            ),
          ),
          ClipOval(
            child: Icon(
              Icons.chat,
              size: MediaQuery.of(context).padding.top,
            ),
          ),
        ],
      )),
      body: Container(
          color: Colors.blueGrey,
          alignment: Alignment.center,
          child: new AspectRatio(
            aspectRatio: 3.0 / 1.0, //    ratio = 宽 / 高 ,
            child: new Container(
              color: Colors.purple,
            ),
          )),
    );
  }
}
