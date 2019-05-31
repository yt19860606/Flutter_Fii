
import 'package:flutter/material.dart';

class Choice {
  const Choice({this.title, this.icon});
  final String title;
  final IconData icon;
}
const List<Choice> choises = <Choice>[
  Choice(title: "自驾", icon: Icons.directions_car),
  Choice(title: "自行车", icon: Icons.directions_bike),
  Choice(title: "乘船", icon: Icons.directions_boat),
Choice(title: "公交车",icon: Icons.directions_bus),
Choice(title: "火车",icon: Icons.directions_railway),
  Choice(title: "步行",icon: Icons.directions_walk),
];
class MeControlerView extends StatelessWidget {
  @override
  final Color selectBackColor = Colors.amber;
  Widget build(BuildContext context) {
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
                child: AppBar(
                  backgroundColor: Colors.white,
                  bottom: TabBar(

                    isScrollable: true,

                    /*设置选中背景的颜色*/
                      indicator: new BoxDecoration(
                        /*方法一*/
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(255, 51, 87, 171),
                            Color.fromARGB(255, 212, 22, 62)
                          ],
                        ),
/*方法二使用图片*/
//                        image: DecorationImage(
//                            image:
//        ExactAssetImage("assets/images/virtual_titleBack.png"),
//                          fit: BoxFit.cover
//                      ),
                      ),
                      indicatorColor: selectBackColor,
                      indicatorSize: TabBarIndicatorSize.tab,
                      unselectedLabelColor: Colors.black,
                      labelColor: Colors.white,
                      tabs: choises.map((Choice choise) {
                        return Tab(
                          text: choise.title,
                        );
                      }).toList()),
                ),
                preferredSize: Size.fromHeight(48)),
            body: TabBarView(
                children: choises.map((Choice choise) {
                  return Padding(
                      padding: EdgeInsets.all(16),
                      child: ChoiseDetail(choice: choise,)
//                child: buildGridV3(),
                  );
                }).toList()),
          )),
    );
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
