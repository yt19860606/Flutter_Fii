import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:english_words/english_words.dart';
import 'package:fii/Draw/wordListPage.dart';

//定义一个globalKey, 由于GlobalKey要保持全局唯一性，我们使用静态变量存储
GlobalKey<ScaffoldState> _globalKey = new GlobalKey();

class HomeScreen extends StatefulWidget {
  HomeScreen(GlobalKey key) {
    _globalKey = key;
  }

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Color deliverBg = Color.fromARGB(255, 11, 97, 109);
  final Color appBarBg = Color.fromARGB(255, 25, 164, 178);
  final _saved = new Set<WordPair>();

//  final String amazonLogo =

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
        leading: Builder(builder: (context) {
          return IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              print("_globalKey--->$_globalKey");

              _globalKey.currentState.openDrawer();
            },
          );
        }),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.favorite), onPressed: _pushSaved),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: _onAdd,child: Icon(Icons.library_books),),

      body: Column(
        children: <Widget>[
          buildSearchBar(size),
          Container(
            color: appBarBg,
            height: 44,
          ),
          Container(
            color: Colors.greenAccent,
            height: 44,
            width: size.width,
            padding: EdgeInsets.all(10),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.place,
                  color: Colors.white,
                ),
                Text(
                  "delver to :",
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildSearchBar(Size size) {
    return Container(
      width: size.width,
      color: appBarBg,
      height: 60.0,
      padding: EdgeInsets.all(10),
      child: Container(
        color: Colors.white,
        child: TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            icon: Icon(Icons.search),
            hintText: "Search",
            suffixIcon: Icon(Icons.camera_alt),
          ),
        ),
      ),
    );
  }

  void _pushSaved() {
    // 跳转收藏页面的方法
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context) {
          final tiles = _saved.map(
            (pair) {
              return new ListTile(
                title: new Text(
                  pair.asPascalCase,
                  style: TextStyle(fontSize: 18.0),
                ),
              );
            },
          );
          // 添加1像素的分割线
          final divided = ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList();
          // 收藏页面
          return new Scaffold(
            appBar: new AppBar(
              title: new Text('Saved Suggestions'),
            ),
            body: new ListView(children: divided),
          );
        },
      ),
    );
  }

  void _onAdd() {
    print("点击+号");
    // 跳转详情页面
    Navigator.of(context).push(new MaterialPageRoute(
      builder: (context) => WordListPageView(),
    ));
  }
}
