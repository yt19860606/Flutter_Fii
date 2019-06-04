import 'package:flutter/material.dart';
import 'package:fii/bottom_nav_widget.dart';
import 'package:fii/setting/login_Screen.dart';

import 'setting/setting_Screen.dart';

//import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;


//void main() => runApp(new MyApp());
//
//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
////    final wordPair = new WordPair.random();
//    return new MaterialApp(
//      title: 'Flutter Test',
//      // 修改主题颜色
//      theme: new ThemeData(
//        primaryColor: Colors.blue,
//      ),
//      home: BottomNavWidget(),
////      home: new RandomWords(),
//    );
//  }
//}





void main() {
//  debugPaintSizeEnabled = true;      //打开视觉调试开关
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false, // 去除debug旗标
//      initialRoute: '/',
//      routes: {
//        '/': (context) {return BottomNavWidget();},
//      },

        home: BottomNavWidget(),


//      home: LoginPage(title: 'Flutter Login'),

      theme: ThemeData(
        highlightColor: Colors.grey,
        primarySwatch: Colors.deepPurple, /*统一设置的导航栏主题颜色*/
      ),
    ),
  );
}





//void main() => runApp(MyApp());
//
//class MyApp extends StatelessWidget {
//  // This widget is the root of your application.
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      debugShowCheckedModeBanner: false,
//      title: 'Flutter Demo',
//      theme: ThemeData(
//        // This is the theme of your application.
//        //
//        // Try running your application with "flutter run". You'll see the
//        // application has a blue toolbar. Then, without quitting the app, try
//        // changing the primarySwatch below to Colors.green and then invoke
//        // "hot reload" (press "r" in the console where you ran "flutter run",
//        // or simply save your changes to "hot reload" in a Flutter IDE).
//        // Notice that the counter didn't reset back to zero; the application
//        // is not restarted.
//        primarySwatch: Colors.blue,
//      ),
//      home: LoginPage(title: 'Flutter Login'),
//    );
//  }
//}
