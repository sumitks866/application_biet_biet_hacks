import 'package:flutter/material.dart';

class Data {
  String title ; 
  String subtitle ; 
  Data({this.title, this.subtitle}) ; 
}
class Contact extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {

  List<Data> list = [
    Data(title: "Address" , subtitle:"Bundelkhand Institute Of Engineering & Technology, Kanpur Road NH-25 JHANSI (U.P)-284128"), 
    Data(title: "Contact", subtitle:"0510-2980211, 2980212"), 
    Data(title: "Email", subtitle:"director@bietjhs.ac.in"), 
    Data(title: "Website", subtitle:"www.bietjhs.ac.in"), 
  ] ; 

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
        title: Text("Contacts", style: TextStyle(color : Colors.white),),
      ),
       body: ListView(
          children: <Widget> [
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
  Data data ; 
  RenderInfo({this.data});
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Color.fromRGBO(2, 52, 130, 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            data.title,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 15.0,
            ),
          ),
          SizedBox(height: 5.0,),
          Text(
            data.subtitle,
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
