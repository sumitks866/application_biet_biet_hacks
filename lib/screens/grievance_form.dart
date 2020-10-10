import 'package:flutter/material.dart';

class Grievances extends StatefulWidget {
  @override
  _GrievancesState createState() => _GrievancesState();
}

class _GrievancesState extends State<Grievances> {

  var _controller1 = TextEditingController();
  var _controller2 = TextEditingController();

  String subject = '';
  String textValue = '';
  String error = '';
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Grievance Redressal'),
        backgroundColor: Color.fromRGBO(2, 52, 130, 1),
      ),
      body: Container(

        padding: EdgeInsets.all(15),
        child: ListView(
          children: <Widget>[
            Text(
              'Grievance Redressal',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 30
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 20,),
            Align(
              alignment: Alignment.topLeft,
             child: Text(
                'Subject',
                style: TextStyle(
                    color: Colors.green[800],
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                ),
                // textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height: 10,),
            Container(
              decoration: BoxDecoration(
                  borderRadius : BorderRadius.all(Radius.circular(5)),
                  color: Colors.white,
                  boxShadow: [BoxShadow(
                      color: Color.fromRGBO(2, 12, 100, .3),
                      blurRadius: 2,
                      offset: Offset(2, 2)
                  )]
              ),
              child: TextFormField(
                controller: _controller1,
                onChanged: (val){
                  setState(() {
                   subject = val;
                  });
                },
                decoration: InputDecoration(
                    hintText: "Grievance Subject",
                    hintStyle: TextStyle(color: Colors.blue[100]),
                    contentPadding: EdgeInsets.fromLTRB(10,0,10,5),
                    border: InputBorder.none
                ),
              ),
            ),
            SizedBox(height: 40,),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Grievance Body',
                style: TextStyle(
                  color: Colors.green[800],
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                // textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height: 10,),
            Container(
              height: 200,
              decoration: BoxDecoration(
                  borderRadius : BorderRadius.all(Radius.circular(5)),
                  color: Colors.white,
                  boxShadow: [BoxShadow(
                      color: Color.fromRGBO(2, 12, 100, .3),
                      blurRadius: 2,
                      offset: Offset(2, 2)
                  )]
              ),
              child: TextField(
                controller: _controller2,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                onChanged: (val){
                  setState(() {
                    textValue = val;
                  });
                },
                decoration: InputDecoration(
                    hintText: "Grievance Body",
                    hintStyle: TextStyle(color: Colors.blue[100]),
                    contentPadding: EdgeInsets.fromLTRB(10,10,10,5),
                    border: InputBorder.none
                ),
              ),
            ),
            SizedBox(height: 20,),
            Center(child:Text(error, style: TextStyle(color: Colors.red),),),
            SizedBox(height: 40,),
            Center(
              child: SizedBox(
                width: 130,
                child: GestureDetector(
                  onTapDown: (_)async {
                    setState(() {
                      isActive = true;
                    });
                    _controller1.clear();
                       _controller2.clear();
                    FocusScope.of(context).unfocus();
                    
                  },
                  onTapUp: (_) {
                    setState(() {
                      isActive = false;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: isActive?Colors.blue[900]:Colors.blue[700]
                    ),
                      padding: EdgeInsets.fromLTRB(15,10,15,10),
                      child: Row(
                        children: <Widget>[
                          Text(
                              ' Submit  ',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18
                            ),
                          ),
                          Icon(
                            Icons.send,
                            color: Colors.white,
                          )
                        ],
                      ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}