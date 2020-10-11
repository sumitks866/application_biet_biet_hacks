import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

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
        backgroundColor: Colors.blue[700],
        title: Text("Gallery", style: TextStyle(color : Colors.white),),
      ),
      body:  Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
         children: <Widget>[
            Container(
             width: double.maxFinite, 
             height : 200, 
             decoration: BoxDecoration(
               image : DecorationImage(image:NetworkImage('http://bietjhs.ac.in/wp-content/uploads/2016/07/DSC_0046-300x188.jpg'),
               fit : BoxFit.fill, 
             ),
             )
           ), 
           SizedBox(height : 10), 
            Container(
              width: double.maxFinite, 
              height : 200, 
              decoration: BoxDecoration(
                image : DecorationImage(image:NetworkImage('http://bietjhs.ac.in/wp-content/uploads/2016/07/DSC_0005-300x188.jpg'),
                fit : BoxFit.cover, 
              ),
              )
            ), 
            SizedBox(height : 10), 
            Container(
              width: double.maxFinite, 
              height : 200, 
              decoration: BoxDecoration(
                image : DecorationImage(image:NetworkImage('http://bietjhs.ac.in/wp-content/uploads/2016/07/DSC_0009-300x188.jpg'),
                fit : BoxFit.cover, 
              ),
              )
            ), 
            SizedBox(height : 10), 
            Container(
              width: double.maxFinite, 
              height : 200, 
              decoration: BoxDecoration(
                image : DecorationImage(image:NetworkImage('http://bietjhs.ac.in/wp-content/uploads/2016/07/DSC_0019-300x188.jpg'),
                fit : BoxFit.cover, 
              ),
              )
            ), 
            SizedBox(height : 10), 
            Container(
              width: double.maxFinite, 
              height : 200, 
              decoration: BoxDecoration(
                image : DecorationImage(image:NetworkImage('http://bietjhs.ac.in/wp-content/uploads/2016/07/DSC_0024-300x188.jpg'),
                fit : BoxFit.cover, 
              ),
              )
            ), 
            SizedBox(height : 10), 
            Container(
              width: double.maxFinite, 
              height : 200, 
              decoration: BoxDecoration(
                image : DecorationImage(image:NetworkImage('http://bietjhs.ac.in/wp-content/uploads/2016/07/DSC_0034-300x188.jpg'),
                fit : BoxFit.cover, 
              ),
              )
            ), 
            SizedBox(height : 10), 
            Container(
              width: double.maxFinite, 
              height : 200, 
              decoration: BoxDecoration(
                image : DecorationImage(image:NetworkImage('http://bietjhs.ac.in/wp-content/uploads/2016/07/DSC_0028-300x188.jpg'),
                fit : BoxFit.cover, 
              ),
              )
            ), 

          ],
        ),
      ),
    );
  }
}