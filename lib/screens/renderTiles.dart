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
      child: Column(
        children: [
          SizedBox(height: 20,),
          Container(
            margin: EdgeInsets.fromLTRB(40.0, 5.0, 40.0, 15.0),
            width: double.maxFinite,
            
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              //borderRadius: BorderRadius.circular(100),
              // boxShadow: [BoxShadow(
              //   color: isActive?Colors.blue[800]:Colors.black,
              //   blurRadius: 3.0,

              //   offset: Offset(5.0,5.0)
              //   ),
              // ],
              border: Border.all(color: Colors.blue[700],width: 4),
              image: DecorationImage(
                image: AssetImage('${widget.tileitem.imageName}'),
                fit : BoxFit.contain,
                
              ),
            ),
          ),
          
          Align(
            alignment : Alignment.bottomCenter ,
            child : RichText(
              text : TextSpan(
                text: '${widget.tileitem.tileName}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color:Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          SizedBox(height : 20),
          Divider(thickness : 2, height : 20,color : Colors.blue[700], indent: 60,endIndent: 60,),
          
        ],
      ),
    );
  }
}