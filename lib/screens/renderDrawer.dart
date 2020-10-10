import 'package:application_biet_biet_hacks/models/draweritem_def.dart';
import 'package:flutter/material.dart';

class RenderDrawer extends StatelessWidget {
  final DrawerItem draweritem;
  RenderDrawer({this.draweritem});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title : Text(draweritem.text) ,
      leading: draweritem.icon,
      onTap: () {
        // Special case for sign out 
        Navigator.pushNamed(context,draweritem.screenName);
      },
    );
  }
}
