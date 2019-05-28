import 'package:flutter/material.dart';
import 'dart:math';
import 'package:fii/DeviceList/DeviceDetail/device_Detail_Screen.dart';



class DeviceListViewScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("设备列表"),
      ),
      body: buildGridV3(),
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
            child: Text("Index $idx",textAlign: TextAlign.center,),
            color: getcolor(),
//            onPressed: (){
//              collectViewPressent(context);
//            },
          );
        }));
  }

  void collectViewPressent(BuildContext context){
    
     Navigator.push(context, MaterialPageRoute(builder:(context)=> DeviceDetailScreen()));
    
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
            onPressed: (){
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
