import 'package:flutter/material.dart';

import 'package:application_biet_biet_hacks/models/draweritem_def.dart';
import 'package:application_biet_biet_hacks/screens/renderDrawer.dart';
import 'package:application_biet_biet_hacks/models/tiles_def.dart';
import 'package:application_biet_biet_hacks/screens/tiles.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<DrawerItem> draweritems = [
    DrawerItem(text: "You",icon: Icon(Icons.person)),
    DrawerItem(text: "Academics",icon: Icon(Icons.book)),
    DrawerItem(text: "Training & Placement",icon: Icon(Icons.dashboard)),
    DrawerItem(text: "Alumni",icon: Icon(Icons.account_balance)),
    DrawerItem(text: "Grievance Redressal",icon: Icon(Icons.inbox)),
    DrawerItem(text: "Contact Us",icon: Icon(Icons.mail)),
    DrawerItem(text: "Sign Out",icon: Icon(Icons.exit_to_app))
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title : Text("BIET JHANSI"),
          backgroundColor : Color.fromRGBO(2, 52, 130, 1),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Container(
                height: 260,
                child: DrawerHeader(
                  child:  Column(
                    children: <Widget>[
                      SizedBox(height: 10.0),
                      Center(
                        child: CircleAvatar(
                          backgroundImage: AssetImage('assets/person.png'),
                          radius: 65,
                        ),
                      ),
                      Text(
                        'your name \nCurrent Session',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.white,
                          //fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                  decoration : BoxDecoration(
                    color : Color.fromRGBO(2, 52, 130, 1),
                  ),
                ),
              ),
              Column(
                children: draweritems.map((draweritem)=>RenderDrawer(draweritem: draweritem)).toList(),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child : RenderTiles(),
        ) ,
      ),
    );
  }
}

class RenderTiles extends StatefulWidget {
  @override
  _RenderTilesState createState() => _RenderTilesState();
}

class _RenderTilesState extends State<RenderTiles> {
  List<TileItem> tileitems = [
    TileItem(tileName: "NOTICES" , imageName: "assets/icon_notice.png" ,screenName: '/notices'),
    TileItem(tileName: "IMS" , imageName: "assets/icon_ims.png",screenName: '/ims' ),
    TileItem(tileName: "EXAMINATION RESULTS" , imageName: "assets/icon_exam.png" ,screenName:'/result' ),
    TileItem(tileName: "DEPARTMENTS" , imageName: "assets/icon_department.png" ,screenName: '/departments'),
    TileItem(tileName: "PHOTO GALLERY" , imageName: "assets/icon_gallery.png",screenName:'/gallery' ),
  ] ;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: tileitems.map((tileitem) => Tiles(tileitem: tileitem)).toList(),
    );
  }
}