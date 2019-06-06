import 'package:flutter/material.dart';
import 'dart:math';
import 'package:fii/DeviceList/DeviceDetail/device_Detail_Screen.dart';

class Choice {
  const Choice({this.title, this.icon});
  final String title;
  final IconData icon;
}

const List<Choice> choises = <Choice>[
  Choice(title: "自驾", icon: Icons.directions_car),
  Choice(title: "自行车", icon: Icons.directions_bike),
  Choice(title: "乘船", icon: Icons.directions_boat)
//Choice(title: "公交车",icon: Icons.directions_bus),
//Choice(title: "火车",icon: Icons.directions_railway),
//  Choice(title: "步行",icon: Icons.directions_walk)
];

final Color selectBackColor = Colors.amber;

class DeviceListViewScreen extends StatelessWidget {
  @override
  TabBar _tabBar = new TabBar(

      /*设置选中背景的颜色*/
//      indicator: new BoxDecoration(
//        /*方法一*/
//        gradient: LinearGradient(
//          colors: [
//            Color.fromARGB(255, 51, 87, 171),
//            Color.fromARGB(255, 212, 22, 62)
//          ],
//        ),
///*方法二使用图片*/
////                        image: DecorationImage(
////                            image:
////        ExactAssetImage("assets/images/virtual_titleBack.png"),
////                          fit: BoxFit.cover
////                      ),
//      ),


      indicator: new ShapeDecoration(
      color: Colors.green, // 底色
  // 统一四边颜色和宽度
//      shape: Border.all(color: Color(0xFF00FFFF),style: BorderStyle.solid,width: 5)
// 四个边分别指定颜色和宽度， 当只给bottom时与UnderlineInputBorder一致效果
//          shape: Border(top: b, bottom: b, right: b, left: b)
// 底部线
//          shape: UnderlineInputBorder( borderSide:BorderSide(color: Color(0xFFFFFFFF), style: BorderStyle.solid, width: 2))
// 矩形边色
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)), side: BorderSide(color: Colors.green, style: BorderStyle.solid, width: 5))
// 圆形边色
//        shape: CircleBorder(side: BorderSide(color: Color(0xFFFFFF00), style: BorderStyle.solid, width: 2))
// 体育场（竖向椭圆）
//        shape: StadiumBorder(side: BorderSide(width: 2, style: BorderStyle.solid, color: Color(0xFF00FFFF))
// 角形（八边角）边色
//          shape: BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)), side: BorderSide(color: Color(0xFFFFFFFF), style: BorderStyle.solid, width: 2))
  ),



//      indicatorPadding:EdgeInsets.all( 10.0),

      isScrollable: true,
      indicatorColor: selectBackColor,
//      indicatorSize: TabBarIndicatorSize.tab,
      unselectedLabelColor: Colors.black,


      labelColor: Colors.white,
      tabs: choises.map((Choice choise) {
        return
              Tab(
                
                child: Container(

                  color: Colors.grey,
//  padding: EdgeInsets.only(top: 10,bottom: 10),
                  width: 150,
                  height: 36,
                  child: Row(

                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(choise.title,),
                      Icon(Icons.laptop),
                    ],
                  ),
                ),
              );
      }).toList());



  Widget build(BuildContext context) {
    print("_tabBar.preferredSize.height = ${_tabBar.preferredSize.height}");

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("设备列表"),
      ),
//      body: buildGridV3(),
      body: DefaultTabController(
          length: choises.length,
          child: Scaffold(
            appBar: PreferredSize(
                child: Container(

//  color: Colors.red,
//height: 40,
////  child:Text("测试"),
//child: Icon(Icons.business),

                  child: AppBar(
                    automaticallyImplyLeading: false,
                    backgroundColor: Colors.white,
                    bottom: _tabBar,
                  ),



                ),
                preferredSize: Size.fromHeight(48)),
            body: TabBarView(
                children: choises.map((Choice choise) {
              return Padding(
                  padding: EdgeInsets.all(1),
                  child: ChoiseDetail(
                    choice: choise,
                  )
//                child: buildGridV3(),
                  );
            }).toList()),
          )),
    );
  }

  /*动态增长的Gridview*/
  Widget buildGridV() {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 2 / 3,
      /*宽高比*/
      children: List.generate(150, (idx) {
        return Card(
          child: Text("Index $idx"),
          color: getcolor(),
        );
      }),
    );
  }

  /*动态增长的Gridview*/
  Widget buildGridV2() {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
        ),
        itemBuilder: ((context, idx) {
          return Card(
            child: Text(
              "Index $idx",
              textAlign: TextAlign.center,
            ),
            color: getcolor(),
//            onPressed: (){
//              collectViewPressent(context);
//            },
          );
        }));
  }

  void collectViewPressent(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => DeviceDetailScreen()));
  }

  /*动态增长的Gridview*/
  Widget buildGridV3() {
    return GridView.builder(
        gridDelegate:
            SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 150),
        itemBuilder: ((context, index) {
          return RaisedButton(
            child: Text("Index $index"),
            color: getcolor(),
            onPressed: () {
              collectViewPressent(context);
            },
          );
        }));
  }

  Color getcolor() {
    return Color.fromARGB(255, Random().nextInt(255), Random().nextInt(255),
        Random().nextInt(255));
  }
}

class ChoiseDetail extends StatelessWidget {
  const ChoiseDetail({Key key, this.choice}) : super(key: key);
  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;

    return Card(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              choice.icon,
            ),
            Text(choice.title),
          ],
        ),
      ),
    );
  }
}


class CustomAppBar extends StatelessWidget {

  final String title;
  final double barHeight = 50.0; // change this for different heights

  CustomAppBar(this.title);

  @override
  Widget build(BuildContext context) {
    final double statusbarHeight = MediaQuery
        .of(context)
        .padding
        .top;

    return new Container(
      padding: new EdgeInsets.only(top: statusbarHeight),
      height: statusbarHeight + barHeight,
      child: new Center(
        child: new Text(
          title,
          style: new TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}