import 'package:application_biet_biet_hacks/models/user.dart';
import 'package:flutter/material.dart';

import 'package:application_biet_biet_hacks/screens/home.dart';
import 'package:application_biet_biet_hacks/screens/login.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    //final user = Provider.of<CustomUser>(context);
    //if(user == null)
     // return Login();
    return Home();
  }
}
