import 'package:flutter/material.dart';

import 'package:application_biet_biet_hacks/models/tiles_def.dart';

class Tiles extends StatefulWidget {
  final TileItem tileitem;
  Tiles({this.tileitem});

  @override
  _TilesState createState() => _TilesState();
}

class _TilesState extends State<Tiles> {
  double elevation = 5;
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_){
        setState(() {
          isActive = !isActive;
          elevation = 0;
        });
        Navigator.pushNamed(context, '${widget.tileitem.screenName}');
      },
      onTapUp: (_){
        setState(() {
          isActive = !isActive;
          elevation = 5;
        });
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(40.0, 5.0, 40.0, 15.0),
        width: double.maxFinite,
        
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [BoxShadow(
            color: Colors.black,
            blurRadius: 2.0,

            offset: Offset(5.0,5.0)
            ),
          ],
         // border: Border.all(color: isActive?Colors.grey[700]:Color.fromRGBO(2, 52, 130, 1),width: 6),
          image: DecorationImage(
            image: AssetImage('${widget.tileitem.imageName}'),
            fit : BoxFit.fill,
            
          ),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(15,20,0,10),
          child: Align(
            alignment : Alignment.bottomCenter ,
            child : RichText(
              text : TextSpan(
                text: '${widget.tileitem.tileName}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color:isActive?Colors.grey[700]:Color.fromRGBO(2, 52, 130, 1),
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}