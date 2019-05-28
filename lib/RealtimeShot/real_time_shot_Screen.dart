import 'package:flutter/material.dart';
import 'dart:math';
import 'package:fii/RealtimeShot/RealTImeDetail/real_time_shot_detail.dart';
import 'package:english_words/english_words.dart';

class ItemModel {
  const ItemModel({this.title, this.route});
  final String title;
  final Route route;
}

class RealTimeShotScreen extends StatelessWidget {
  final List<ItemModel> _items = [];
final wordPair = WordPair.random();
  static String horseUrl = 'https://i.stack.imgur.com/Dw6f7.png';
  static String cowUrl = 'https://i.stack.imgur.com/XPOr3.png';
  static String camelUrl = 'https://i.stack.imgur.com/YN0m7.png';
  static String sheepUrl = 'https://i.stack.imgur.com/wKzo8.png';
  static String goatUrl = 'https://i.stack.imgur.com/Qt4JP.png';

  final List<String> imageAry = [horseUrl, cowUrl, camelUrl, sheepUrl, goatUrl];

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
    return ListView(children: List.generate(20, generator));
  }

/*动态增长的listview*/
  Widget buildList2V() {
    return ListView.builder(
        padding: const EdgeInsets.all(0.0),
        itemCount: 15,
        itemBuilder: (context, index) {
//          if (index.isOdd) {
//            return Divider(); /*添加listView分割线*/
//          }
          return generator2(context: context, index: index);
        });
  }

  Widget generator(int index) {
    return mySelfcard(index);
  }

  Widget generator2({BuildContext context, int index}) {
//    final bool alreadySaved = _saved.contains(pair);

    int index = Random().nextInt(5);
    var imageUrl = imageAry[index];

    return Container(
      color: Colors.green,

      height: 81.0,

      child: (Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            height: 80,
            child: ListTile(
              title: Text(
                "$wordPair.asPascalCase--$index",
                textAlign: TextAlign.center,
              ),
              onTap: () => onPressend(context: context, index: index),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(imageUrl),
              ),
            ),
          ),
          Divider(
            height: 1.0,
            indent: 0.0,
            color: Colors.red,
          )
        ],
      )),
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
//      color: getcolor(),
      color: Colors.white,

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
