import 'package:application_biet_biet_hacks/models/student_def.dart';
import 'package:application_biet_biet_hacks/models/user.dart';
import 'package:application_biet_biet_hacks/shared/global.dart';
import 'package:application_biet_biet_hacks/shared/loading.dart';
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
    final user = Provider.of<CustomUser>(context);
    if(user == null) return Login();
    else {
      print(user.uid);
        return FutureBuilder<StudentData>(
          future: initData(),
          builder: (context, AsyncSnapshot<StudentData> snapshot){
            if(snapshot.hasData)
              return Home();
            else return Loading();
          }
        );
    }
  }
}
