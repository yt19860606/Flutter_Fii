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
          var indexRow = (index ~/ 2) as int;
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
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
      color: Colors.blueGrey,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Icon(
              Icons.settings_overscan,
              size: 80.0,
            ),
//            margin: EdgeInsets.only(left: 10),
//            width: 100,
//            height: 100,
            color: Colors.red,
          ),
          Padding(
            padding: EdgeInsets.only(left: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  "设备名称",
                  style: TextStyle(backgroundColor: Colors.green),
                ),
                Text("此处为消息---------",
                    style: TextStyle(backgroundColor: Colors.blue))
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Text("2019-05-16"),
            color: Colors.red,
            padding: EdgeInsets.only(left: 0, right: 0),
          )
        ],
      ),
    );
  } else if (index == 2) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Flexible(
          child: Container(
            color: Colors.greenAccent,
            child: Text(
              "标题哈哈哈----------",
              style: TextStyle(backgroundColor: Colors.green),
            ),
//            Icon(
//              Icons.settings_overscan,
//              size: 80.0,
//            ),
          ),
//          flex: 5,
        ),
        Flexible(
          child: Container(
            alignment: Alignment.center,

            color: Colors.red,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  "设备名称",
                  style: TextStyle(backgroundColor: Colors.green),
                ),
                Text("--Align-------Align--------",
                    style: TextStyle(backgroundColor: Colors.blue)),
                Align(
                  widthFactor: 2,
                  heightFactor: 2,
                  alignment: Alignment.topLeft,
//                  heightFactor: 50,
                  child: Text("Align---------",
                      style:
                          TextStyle(backgroundColor: Colors.deepOrangeAccent)),
                )
              ],
            ),

//            alignment: Alignm,
          ),
//          flex: 3,
        ),
        Flexible(
          child: Container(
            color: Colors.yellow,
            child: Text("2019-05-16-------------------------------"),
          ),
//          flex: 1,
        ),
      ],
    );
  } else {
    return Column(
      children: <Widget>[
        Container(
          height: 120,
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
