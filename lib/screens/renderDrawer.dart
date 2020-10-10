import 'package:application_biet_biet_hacks/screens/draweritem_def.dart';
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
        Navigator.pop(context);
      },
    );
  }
}
