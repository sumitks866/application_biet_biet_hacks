import 'package:flutter/material.dart';

class Ims extends StatelessWidget {
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
        title: Text("IMS", style: TextStyle(color : Colors.white),),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10,20,10,20),
        child:ListView(
          children: <Widget>[
            Text(
              "Institute Management System",
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            RaisedButton(
              onPressed: (){
                Navigator.pushNamed(context, '/you');
              },
              child: Icon(Icons.person),
            )
          ],
        ),
      ),
    );
  }
}