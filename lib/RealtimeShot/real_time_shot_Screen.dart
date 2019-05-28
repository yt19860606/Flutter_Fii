import 'package:flutter/material.dart';
import 'dart:math';
import 'package:fii/RealtimeShot/RealTImeDetail/real_time_shot_detail.dart';

class ItemModel {
  const ItemModel({this.title, this.route});
  final String title;
  final Route route;
}

class RealTimeShotScreen extends StatelessWidget {
  final List<ItemModel> _items = [];

  _getItems() {
    _items.clear();
    _items.add(new ItemModel(
        title: "详情",
        route: MaterialPageRoute(
            builder: (BuildContext context) => RealTimeShotDetail())));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    _getItems();

    return Scaffold(
      appBar: AppBar(
        title: Text("实时快照"),
      ),
      body: buildList2V(),
    );
  }

/*静态固定树木的listView*/
  Widget buildListV() {
    return ListView(children: List.generate(120, generator));
  }

/*动态增长的listview*/
  Widget buildList2V() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: 15,
        itemBuilder: (context, index) {
          if (index.isOdd) {
            return Divider(); /*添加listView分割线*/
          }
          return generator2(context: context, index: index);
        });
  }

  Widget generator(int index) {
    return mySelfcard(index);
  }

  Widget generator2({BuildContext context, int index}) {
//    final bool alreadySaved = _saved.contains(pair);
    return new ListTile(
      title: Text(
        "你好啊-----$index",
        textAlign: TextAlign.center,
      ),
      onTap: () => onPressend(context: context, index: index),
    );
  }

//  void onPressend({BuildContext context ,int index}){
//
//    Navigator.push(context, getItemRoute(index));
//}

  void onPressend({BuildContext context, int index}) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RealTimeShotDetail()),
    );
  }

  String _getItemTitle(int index) {
//    return _items[index].title;
    return _items.first.title;
  }

  Route getItemRoute(int index) {
//    return _items[index].route;
    return _items.first.route;
  }

  Widget mySelfcard(int index) {
    return Card(
      child: Container(
        height: 150,
        color: getcolor(),
        child: Column(
          children: <Widget>[
//        buildListVCell(index),
            buildMyListVCell(index, Size(100, 50)),

            buildMyListVCell(index * 2, Size(150, 50)),
          ],
        ),
//        child: buildListVCell(index ),
      ),
    );
  }

  Widget buildMyListVCell(var count, Size size) {
    var ary = ["haha", "hehe", "你好吧", "很好啊", '234', '我是😯'];

    for (var idx in ary) {
      print("$idx + $count");
    }

    return Container(
      width: size.width,
      height: size.height,
      color: getcolor(),
      child: Text(
        "abcde你好啊----$count",
        textAlign: TextAlign.center,
      ),
    );
  }
}

Widget buildListVCell(var count) {
  var ary = ["haha", "hehe", "你好吧", "很好啊", '234', '我是😯'];

  for (var idx in ary) {
    print("$idx + $count");
  }

  return Text(
    "abcde你好啊----$count",
    textAlign: TextAlign.center,
    style: TextStyle(color: Colors.white, fontSize: 30, wordSpacing: 80),
  );
}

Color getcolor() {
  return Color.fromARGB(
      255, Random().nextInt(255), Random().nextInt(255), Random().nextInt(255));
}
