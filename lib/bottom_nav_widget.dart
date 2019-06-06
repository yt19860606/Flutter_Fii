import 'package:flutter/material.dart';
import 'package:fii/DeviceList/device_list_Screen.dart';
import 'package:fii/Home/home_screen.dart';
import 'package:fii/RealtimeShot/real_time_shot_Screen.dart';
import 'package:fii/Voice/voice_View_Screen.dart';
import 'package:fii/setting/setting_Screen.dart';
import 'dart:io';
import 'package:fii/Draw/drawLeftDetailPage.dart';

class BottomNavWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new BottomNavWidgetState();
  }
}

enum TabItem {
  home,
  photoCamera,
  mic,
  deviceData,
  account_circle,
}

class BottomNavWidgetState extends State<BottomNavWidget> {
  static GlobalKey<ScaffoldState> _globalKey = new GlobalKey();

  final bottomNavColor = Colors.indigoAccent;
  int _currentIndex = 0;
  TabItem _currentItem = TabItem.home;
  List<Widget> list = List();

  @override
  void initState() {
    // TODO: implement initState
    list
      ..add(HomeScreen(_globalKey))
      ..add(RealTimeShotScreen())
      ..add(VoiceViewScreen())
      ..add(DeviceListViewScreen())
      ..add(settingScreen());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget userHeader = UserAccountsDrawerHeader(
      accountName: new Text('Aller_Dong'),
      accountEmail: new Text('Aller_Dong@163.com'),
      currentAccountPicture: new CircleAvatar(

        backgroundImage: NetworkImage(
            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1559793152251&di=85ca8cb42a23f0cb150a32808a396080&imgtype=0&src=http%3A%2F%2Fpic45.nipic.com%2F20140805%2F7447430_145220850000_2.jpg"),
        radius: 35.0,
      ),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  "http://img2.ph.126.net/L2YRmNY7w5Pxwzkv1mLYCA==/2662190329746931916.jpg"),
              fit: BoxFit.cover,colorFilter: ColorFilter.mode(Colors.green[300].withOpacity(0.6), BlendMode.hardLight)),),
    );

    // TODO: implement build
    return Scaffold(
      key: _globalKey,
      drawer: new Drawer(
        child: ListView(
          // 去除顶部灰色条
          padding: EdgeInsets.zero,
          children: <Widget>[
            userHeader,
            ListTile(
              title: Text("注册登录"),
              leading: Icon(Icons.favorite),
              onTap: () => _onPageOpen(context, "注册登录"),
            ),
            Divider(
              height: 1.0,
              indent: 0.0,
              color: Colors.grey,
            ),
            ListTile(
              title: Text("设置"),
              leading: Icon(Icons.settings),
              onTap: () => _onPageOpen(context, "设置"),
            ),
            Divider(
              height: 1.0,
              indent: 0.0,
              color: Colors.grey,
            ),
          ],
        ),
      ),

      body: list[_currentIndex],

      bottomNavigationBar: buildBottomNavigationBarMySelf(),
//      bottomNavigationBar: buildBottomNavigationBar2(),
//        bottomNavigationBar: buildBottomNav3(),
    );
  }

  /*自定义标签栏*/
  Widget buildBottomNavigationBarMySelf() {
    return SafeArea(
        child: SizedBox(
            height: 50.0,
            child: Card(
                color: Platform.isIOS ? Colors.transparent : Colors.white,
                elevation: Platform.isIOS ? 0.0 : 8.0,
                // iphone 无阴影
                shape: RoundedRectangleBorder(),
                margin: EdgeInsets.all(0.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Divider(color: Color(0xFFE0E0E0), height: 0.5),
                      Expanded(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              _buildBottomItem(
                                  icon: Icons.home,
                                  text: tabItemName(TabItem.home),
                                  index: 0),
                              _buildBottomItem(
                                  icon: Icons.photo_camera,
                                  text: tabItemName(TabItem.photoCamera),
                                  index: 1),
                              _buildBottomItem(
                                  icon: Icons.mic,
                                  text: tabItemName(TabItem.mic),
                                  index: 2),
                              _buildBottomItem(
                                  icon: Icons.perm_data_setting,
                                  text: tabItemName(TabItem.deviceData),
                                  index: 3),
                              _buildBottomItem(
                                  icon: Icons.account_circle,
                                  text: tabItemName(TabItem.account_circle),
                                  index: 4),
                            ]),
                      )
                    ]))));
  }

  Widget _buildBottomItem({IconData icon, String text, int index}) {
    Color color = _currentIndex == index ? Colors.blue : Colors.grey;
    return Expanded(
        child: InkResponse(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(icon, color: color, size: 22.0),
                  // Image.asset(, color: color, width: 22.0, height: 22.0),
                  Text(text, style: TextStyle(color: color, fontSize: 10.0))
                ]),
            onTap: () => setState(() => _currentIndex = index)));
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      _currentItem = TabItem.values[_currentIndex];
    });
  }

// 切换item的颜色，选中用primaryColor，其他都是grey
  Color _colorTabMatching({TabItem item}) {
    return _currentIndex == item ? Theme.of(context).primaryColor : Colors.grey;
  }

  Widget buildBottomNavigationBar2() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: _onTabTapped,
      type: BottomNavigationBarType.fixed, //标题填充
      items: [
        _buildItem(icon: Icons.home, tabItem: TabItem.home),
        _buildItem(icon: Icons.photo_camera, tabItem: TabItem.photoCamera),
        _buildItem(icon: Icons.mic, tabItem: TabItem.mic),
        _buildItem(icon: Icons.perm_data_setting, tabItem: TabItem.deviceData),
        _buildItem(icon: Icons.account_circle, tabItem: TabItem.account_circle),
      ],
    );
  }

  BottomNavigationBarItem _buildItem({IconData icon, TabItem tabItem}) {
    String title = tabItemName(tabItem);
    return BottomNavigationBarItem(
        icon: Icon(
          icon,
        ),
        title: Text(
          title,
        ));
  }

  BottomNavigationBar buildBottomNav3() {
    return BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int idx) {
          setState(() {
            _currentIndex = idx;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              title: Text(tabItemName(TabItem.home))),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.photo_camera,
              ),
              title: Text(tabItemName(TabItem.photoCamera))),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.mic,
              ),
              title: Text(tabItemName(TabItem.mic))),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.perm_data_setting,
              ),
              title: Text(tabItemName(TabItem.deviceData))),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle,
              ),
              title: Text(tabItemName(TabItem.account_circle))),
        ]);
  }

  // 跳转侧边栏详情页面
  void _onPageOpen(context, String title) {
    // 关闭侧边栏
    Navigator.pop(context);
    // 跳转页面
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => DrawerLeftDetailPager(title)));
  }
}

String tabItemName(TabItem tabItem) {
  switch (tabItem) {
    case TabItem.home:
      return "首页";
    case TabItem.photoCamera:
      return "实时快照";
    case TabItem.mic:
      return "语音";
    case TabItem.deviceData:
      return "设备数据";
    case TabItem.account_circle:
      return "我的";
  }
  return null;
}
