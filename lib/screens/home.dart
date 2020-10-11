import 'dart:async';
import 'dart:io';

import 'package:application_biet_biet_hacks/serivce/upload_notification.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:application_biet_biet_hacks/shared/ProfilePic.dart';
import 'package:flutter/material.dart';
import 'package:application_biet_biet_hacks/shared/global.dart';
import 'package:application_biet_biet_hacks/models/draweritem_def.dart';
import 'package:application_biet_biet_hacks/screens/renderDrawer.dart';
import 'package:application_biet_biet_hacks/models/tiles_def.dart';
import 'package:application_biet_biet_hacks/screens/renderTiles.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<DrawerItem> draweritems = [
    DrawerItem(text: "You",icon: Icon(Icons.person),screenName: '/you'),
  //  DrawerItem(text: "Academics",icon: Icon(Icons.book),screenName: '/academics'),
    DrawerItem(text: "Training & Placement",icon: Icon(Icons.dashboard),screenName: '/tandp'),
  //  DrawerItem(text: "Alumni",icon: Icon(Icons.account_balance),screenName: '/alumni'),
    DrawerItem(text: "Grievance Redressal",icon: Icon(Icons.inbox),screenName: '/showgrievances'),
    DrawerItem(text: "Contact Us",icon: Icon(Icons.mail), screenName: '/contact'),
    DrawerItem(text: "Sign Out",icon: Icon(Icons.exit_to_app))
  ];

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final FirebaseMessaging _fcm = FirebaseMessaging() ; 
  StreamSubscription iosSubscription;
  @override
  void initState() {
      super.initState();
      _fcm.getToken().then((token) {
        print(token) ; 
      }) ; 
      if (Platform.isIOS) {
          iosSubscription = _fcm.onIosSettingsRegistered.listen((data) {
              // save the token  OR subscribe to a topic here
          });

          _fcm.requestNotificationPermissions(IosNotificationSettings());
      }
      _fcm.configure(
        onMessage: (Map<String, dynamic> message) async {
          print("onMessage: $message");
          // final snackBar = SnackBar(
          //   content: Text('A new Notice arrived!'), 
          //   action: SnackBarAction(
          //     label: "Go to Notices",
          //     onPressed: () {
          //       Navigator.pushNamed(context,'/notices') ;
          //     },
          //     ),
          // );
          // _scaffoldKey.currentState.showSnackBar(snackBar);

          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              backgroundColor: Colors.blue[700],
                    content: ListTile(
                    title: Text(message['notification']['title'], style: TextStyle(color: Colors.white),),
                    subtitle: Text(message['notification']['body'], style: TextStyle(color: Colors.white),),
                    ),
                    actions: <Widget>[
                    FlatButton(
                      child: Text('OK',style: TextStyle(color: Colors.white)),
                        onPressed: () {
                           dynamic upload = UploadNotice().upload(message['notification']['title'], message['notification']['body']) ; 
                          Navigator.pushNamed(context,'/shownotices' ) ;
                        }
                    ),
                ],
            ),
          );
              
          
        },
      onLaunch: (Map<String, dynamic> message) async {
          print("onLaunch: $message");
          // TODO optional
      },
      onResume: (Map<String, dynamic> message) async {
          print("onResume: $message");
          // TODO optional
      },
    );
    
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        key : _scaffoldKey,
        appBar: AppBar(
          title : Text("BIET JHANSI", style: GoogleFonts.montserrat(),),
          backgroundColor : Colors.blue[700],
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
                      ProfilePic(),
                      SizedBox(height: 12,),
                      Text(
                        '${currActiveStudent.name}\n${currActiveStudent.rollNumber}',
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
                    color : Colors.blue[700],
                  ),
                ),
              ),
              Column(
                children: draweritems.map((draweritem)=>RenderDrawer(draweritem: draweritem)).toList(),
              ),
            ],
          ),
        ),
        body: Container(
          margin: EdgeInsets.fromLTRB(0, 20, 0,0),
          decoration: BoxDecoration(
            color : Colors.white,
          ),
          child: RenderTiles(),
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
    TileItem(tileName: "ATTENDANCE" , imageName: "assets/icon_attendance.png" ,screenName: '/attendance'),
    TileItem(tileName: "NOTICES" , imageName: "assets/icon_notes.png" ,screenName: '/notices'),
    TileItem(tileName: "IMS" , imageName: "assets/icon_ims.png",screenName: '/ims' ),
    TileItem(tileName: "EXAMINATION RESULTS" , imageName: "assets/icon_exam.png" ,screenName:'/result' ),
    //TileItem(tileName: "DEPARTMENTS" , imageName: "assets/icon_department.png" ,screenName: '/departments'),
    TileItem(tileName: "PHOTO GALLERY" , imageName: "assets/icon_gallery.png",screenName:'/gallery' ),
  ] ;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: tileitems.map((tileitem) => Tiles(tileitem: tileitem)).toList(),
    );
  }
  
}


