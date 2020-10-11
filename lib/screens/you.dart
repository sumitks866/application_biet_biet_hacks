import 'package:application_biet_biet_hacks/shared/ProfilePic.dart';
import 'package:flutter/material.dart';
import 'package:application_biet_biet_hacks/shared/global.dart';

class Stk {
  final String key;
  final String val;
  Stk({this.key,this.val});
}

class You extends StatefulWidget {
  @override
  _YouState createState() => _YouState();
}

class _YouState extends State<You> {

  List<Stk> list=[
    Stk(key: 'Name',val: currActiveStudent.name),
    Stk(key: 'Roll Number',val: currActiveStudent.rollNumber),
    Stk(key: 'Branch',val: currActiveStudent.branch),
    Stk(key: 'Email',val: currActiveStudent.email),
    Stk(key: 'Gender',val: currActiveStudent.gender),
    Stk(key: 'Category',val: currActiveStudent.category),
    Stk(key: 'Father',val: currActiveStudent.father),
    Stk(key: 'Mother',val: currActiveStudent.mother),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon : Icon(Icons.arrow_back, color : Colors.white),
          onPressed: (){
            Navigator.pop(context) ;
          },
        ),
        backgroundColor: Colors.blue[700],
        title: Text("You", style: TextStyle(color : Colors.white),),
      ),
      body: ListView(
          children: <Widget>[
            SizedBox(height: 15,),
            ProfilePic(),
            SizedBox(height: 15,),
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: list.map((stk) => RenderInfo(data: stk)).toList(),
              ),
            ),
          ]
      ),
    );
  }
}

class RenderInfo extends StatelessWidget {
  final Stk data;
  RenderInfo({this.data});
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Color.fromRGBO(2, 52, 130, 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            data.key,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 15.0,
            ),
          ),
          SizedBox(height: 5.0,),
          Text(
            data.val,
            style: TextStyle(
              color: Colors.amber[700],
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Divider(
            height: 40,
            color: Colors.blue[800],
          ),
        ],
      ),
    );
  }
}
