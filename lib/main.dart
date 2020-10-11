import 'package:application_biet_biet_hacks/models/user.dart';
import 'package:application_biet_biet_hacks/screens/academics.dart';
import 'package:application_biet_biet_hacks/screens/alumni.dart';
import 'package:application_biet_biet_hacks/screens/attendance.dart';
import 'package:application_biet_biet_hacks/screens/contact.dart';
import 'package:application_biet_biet_hacks/screens/department.dart';
import 'package:application_biet_biet_hacks/screens/gallery.dart';
import 'package:application_biet_biet_hacks/screens/grievance_form.dart';
import 'package:application_biet_biet_hacks/screens/ims.dart';
import 'package:application_biet_biet_hacks/screens/notice.dart';
import 'package:application_biet_biet_hacks/screens/result.dart';
import 'package:application_biet_biet_hacks/screens/show_girevances.dart';
import 'package:application_biet_biet_hacks/screens/tandp.dart';
import 'package:application_biet_biet_hacks/screens/you.dart';
import 'package:application_biet_biet_hacks/serivce/authentication.dart';
import 'package:flutter/material.dart';
import 'package:application_biet_biet_hacks/wrapper..dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  
  Widget build(BuildContext context) {
    return StreamProvider<CustomUser>.value(
      value: AuthenticationService().users,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
          routes: {
            '/':(context)=>Wrapper(),
            '/you':(context)=> You(),
            '/departments': (context)=>Departments(),
            '/result': (context)=>Result(),
            '/ims': (context)=>Ims(),
            '/gallery': (context)=>Gallery(),
            '/notices':(context)=>Notice(),
            '/grievancesform':(context)=>GrievancesForm(),
            '/showgrievances':(context)=>ShowGrievances(),
            '/academics': (context)=>Academics(), 
            '/tandp':(context)=>TandP(),
            '/alumni':(context)=>Alumni(),
            '/contact':(context)=>Contact(),
            '/attendance':(context)=>Attendance(),
          },
      ),
    );
  }
}

