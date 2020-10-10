import 'package:application_biet_biet_hacks/models/draweritem_def.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RenderDrawer extends StatelessWidget {

  final DrawerItem draweritem;
  RenderDrawer({this.draweritem});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title : Text(draweritem.text) ,
      leading: draweritem.icon,
      onTap: () async {
        // Special case for sign out
        if(draweritem.text == 'Sign Out') {
           await FirebaseAuth.instance.signOut();
        }
        Navigator.pushNamed(context,draweritem.screenName);
      },
    );
  }
}
