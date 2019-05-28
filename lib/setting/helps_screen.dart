import 'package:flutter/material.dart';

//class HelpsScreenVc extends StatefulWidget {
//  @override
//  _HelpsScreenVcState createState() => _HelpsScreenVcState();
//}
//
//class _HelpsScreenVcState extends State<HelpsScreenVc> {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('常见问题'),
//    );
//
//}

class HelpsScreenVc extends StatefulWidget {
  @override
  _HelpsScreenVcState createState() => _HelpsScreenVcState();
}

class _HelpsScreenVcState extends State<HelpsScreenVc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("常见意见"),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {

          var indexRow =  (index ~/ 2) as int ;
          print("当前视图是index:$index  indexRow = $indexRow ");

          return cellCustomView(context: context, index: index);
        },
      ),
    );
  }
}

Widget cellCustomView({BuildContext context, int index}) {
  if (index == 0) {
    return Container(
      height: 60,
      color: Colors.grey,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            children: <Widget>[
              Icon(Icons.photo_camera),
              Text(
                "这是-----",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Icon(Icons.print),
              Text(
                "这是-----",
                style: TextStyle(fontSize: 20, backgroundColor: Colors.red),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Icon(Icons.list),
              Text(
                "这是-----",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  } else if (index == 1) {
    return Container(
      width: 200,
      height: 120,
      color: Colors.lightBlueAccent,
    );
  } else {
    return Column(
      children: <Widget>[
        Container(
          height: 80,
          color: Colors.amberAccent,
        ),
        /*分割线*/
        Divider(
          height: 1.0,
          indent: 0.0,
          color: Colors.red,
        ),
      ],
    );
  }
}
