import 'package:flutter/material.dart';

class Academics extends StatelessWidget {
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
        title: Text("Academics", style: TextStyle(color : Colors.white),),
      ),
      body: SafeArea(
        child:Text("acads") ,
      ),
    );
  }
}