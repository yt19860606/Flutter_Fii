import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_section_table_view/flutter_section_table_view.dart'
    show SectionTableController, SectionTableView;
import 'package:english_words/english_words.dart';
import 'helps_screen.dart';
import 'about_Screen.dart';
import 'me_Screen.dart';


abstract class settingModel {} /*抽象类*/

class SettingData extends settingModel {
  var assetName;
  var title;
  SettingData({this.assetName, this.title});
}

class SettingLine extends settingModel {}

final datas = {
  "1": [SettingData(assetName: "assets/images/user_collect.png", title: "收藏")],
  "2": [SettingData(assetName: "assets/images/user_setting.png", title: "设置")],
  "3": [
    SettingData(assetName: "assets/images/user_service.png", title: "客服"),
    SettingData(assetName: "assets/images/user_help.png", title: "帮助"),
    SettingData(assetName: "assets/images/user_about.png", title: "关于")
  ]
};

class settingScreen extends StatelessWidget {
  final controller = SectionTableController(
      sectionTableViewScrollTo: (section, row, isScrollDown) {
    print('received scroll to $section $row scrollDown:$isScrollDown');
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "我的",
          style: TextStyle(color: Colors.black),

        ),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SectionTableView(
          sectionCount: 5,
          numOfRowInSection: (section) {
            var sectionValue = 1;
            switch (section) {
              case 0:
                sectionValue = 1;
                break;
              case 1:
                sectionValue = 1;
                break;
              case 2:
                sectionValue = 1;
                break;

              case 3:
                sectionValue = 3;
                break;

              case 4:
                sectionValue = 1;
                break;
            }
            return section = sectionValue;
          },
          cellAtIndexPath: (section, row) {
            switch (section) {
              case 0:
                return _generatorProfileHeaderWidget(context);
                break;
              case 1:
                return cellCustomView(context: context,section: section, row: row);

                break;
              case 2:
                return cellCustomView(context: context,section: section, row: row);

                break;
              case 3:
                return cellCustomView(context: context,section: section, row: row);

                break;
              case 4:
                return Container(
                  color: Color.fromARGB(255, 233, 93, 93),
                  height: 50.0,
                  child: Center(
                    child: Text(
                      '退出登陆',
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ),
                );
                break;
            }
          },
          headerInSection: (section) {
            if (section != 0) {
              return Container(
                height: 10,
                color: Color.fromARGB(255, 235, 235, 235),
              );
            } else {
              return Container(
                height: 0,
                color: Color.fromARGB(255, 235, 235, 235),
              );
            }
          },
          divider: Container(
            color: Color.fromARGB(255, 235, 235, 235),
            height: 1.0,
          ),

          controller: controller, //SectionTableController
          sectionHeaderHeight: (section) => 25.0,
          dividerHeight: () => 1.0,
          cellHeightAtIndexPath: (section, row) => 44.0,
        ),
      ),
    );
  }

  Widget _generatorProfileHeaderWidget(BuildContext context) {
    return Container(
      height: 140.0,
      child: Center(
        child: Stack(children: <Widget>[
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: Image.asset(
              'assets/images/user_bg.png',
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            left: 14,
            top: 36,
            bottom: 36,
            child: Image.asset(
              'assets/images/avatar.png',
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            left: 98.0,
            right: 160.0,
            top: 52.0,
            child: new Text(
              'Whatever',
              style: new TextStyle(
                fontSize: 16.0,
                fontFamily: 'serif',
                color: Colors.white
              ),
            ),
          ),
          Positioned(
            left: 98.0,
            right: 160.0,
            bottom: 50.0,
            child: new Text(
              'G00152889',
              style: new TextStyle(
                fontSize: 14.0,
                fontFamily: 'serif',
                  color: Colors.white
              ),
            ),
          ),
          Positioned(
            right: 16.0,
            bottom: 42.0,
            top: 42,
            width: 28,
            child: Image.asset("assets/images/list_in.png"),
          ),
        ]),
      ),
    );
  }

  /**/
  Widget cellCustomView({BuildContext context,int section, int row}) {
    print('section = $section' + 'row = $row');
    final List<SettingData> listAry = datas[section.toString()];
    final model = listAry[row];

    return ListTile(
      onTap: () {
        print("点击 $section ---$row");

        switch (section)
        {
          case 0:{

          }
          break;

          case 1:{


            Navigator.push(context, MaterialPageRoute(builder: (context)=> MeControlerView()));

          }
          break;
          case 2:{

          }
          break;
          case 3:{

            switch (row){
              case 0:{

              }break;

              case 1:{
                Navigator.push(context, MaterialPageRoute(builder: (context)=> HelpsScreenVc()));
              }break;

              case 2:{
                Navigator.push(context, MaterialPageRoute(builder: (context)=> AboutScreenView ()));

              }break;



            }

          }
          break;
          case 4:{

          }
          break;

        }


      },
      leading: Container(
        width: 30.0,
        child: Image.asset(model.assetName),
      ),
      title: Text('${model.title}'),
      trailing: Container(
        width: 28.0,
        height: 56,
//        child: Icon(Icons.arrow_forward_ios,color: Colors.grey,),
        child: Image.asset("assets/images/list_in.png"),
      ),
    );
  }

  Widget buildAppBar() {
    return AppBar(
      leading: Icon(Icons.menu),
      elevation: 0.0,
      title: Align(
        child: Image.asset(
          "assets/images/amazon_logo_beacon.png",
          color: Colors.white,
          height: 30,
        ),
        alignment: Alignment.centerLeft,
      ),
      actions: <Widget>[
        Icon(Icons.notifications_none),
        Icon(Icons.shopping_cart),
      ],
      backgroundColor: Colors.white,
    );
  }
}


