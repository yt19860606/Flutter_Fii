import 'package:flutter/material.dart';
import 'package:fii/bottom_nav_widget.dart';

import 'setting/setting_Screen.dart';

//import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

void main() {
//  debugPaintSizeEnabled = true;      //打开视觉调试开关
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false, // 去除debug旗标
      initialRoute: '/',
      routes: {
        '/': (context) {return BottomNavWidget();},
      },


//        home: Scaffold(
//        body: BottomNavWidget(),
//      ),

      theme: ThemeData(
        highlightColor: Colors.grey,
      ),
    ),
  );
}
