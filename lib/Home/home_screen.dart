import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Color appBarBg = Color.fromARGB(255, 25, 164, 178);
  final Color deliverBg = Color.fromARGB(255, 11, 97, 109);

//  final String amazonLogo =

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: buildAppBar(),
      body: Column(
        children: <Widget>[
          buildSearchBar(size),
          Container(
            color: appBarBg,
            height: 44,
          ),
          Container(
            color: Colors.greenAccent ,
            height: 44,
            width: size.width,
            padding: EdgeInsets.all(10),
            child: Row(
              children: <Widget>[
                Icon(Icons.place,color: Colors.white,),
                Text("delver to :",style: TextStyle(color: Colors.white
                ),)



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
      backgroundColor: appBarBg,
    );
  }
}
