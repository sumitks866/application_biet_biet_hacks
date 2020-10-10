import 'package:application_biet_biet_hacks/screens/academics.dart';
import 'package:application_biet_biet_hacks/screens/alumni.dart';
import 'package:application_biet_biet_hacks/screens/contact.dart';
import 'package:application_biet_biet_hacks/screens/department.dart';
import 'package:application_biet_biet_hacks/screens/gallery.dart';
import 'package:application_biet_biet_hacks/screens/grievance.dart';
import 'package:application_biet_biet_hacks/screens/ims.dart';
import 'package:application_biet_biet_hacks/screens/notice.dart';
import 'package:application_biet_biet_hacks/screens/result.dart';
import 'package:application_biet_biet_hacks/screens/tandp.dart';
import 'package:application_biet_biet_hacks/screens/you.dart';
import 'package:flutter/material.dart';
import 'package:application_biet_biet_hacks/wrapper..dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
        routes: {
          '/':(context)=>Wrapper(),
          '/you':(context)=> You(),
          '/departments': (context)=>Departments(),
          '/result': (context)=>Result(),
          '/ims': (context)=>Ims(),
          '/gallery': (context)=>Gallery(),
          '/notices':(context)=>Notice(),
          '/grievance':(context)=>Grievance(),
          '/academics': (context)=>Academics(), 
          '/tandp':(context)=>TandP(),
          '/alumni':(context)=>Alumni(),
          '/grievance':(context)=>Grievance(),
          '/contact':(context)=>Contact(),
        },
    );
  }
}

