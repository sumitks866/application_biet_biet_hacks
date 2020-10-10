import 'package:flutter/material.dart';

class Gallery extends StatelessWidget {
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
        title: Text("Gallery", style: TextStyle(color : Colors.white),),
      ),
      body: SafeArea(
        child:Text("gallery") ,
      ),
    );
  }
}