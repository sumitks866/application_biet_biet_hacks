import 'package:flutter/material.dart';

class Notice extends StatefulWidget {
  @override
  _NoticeState createState() => _NoticeState();
}

class _NoticeState extends State<Notice> {

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
        backgroundColor: Color.fromRGBO(2, 52, 130, 1),
        title: Text("Notice", style: TextStyle(color : Colors.white),),
      ),
      body: SafeArea(
        child:Text("notices") ,
      ),
    );
  }
}