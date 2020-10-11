import 'package:application_biet_biet_hacks/shared/attendance_handler.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Attendance extends StatefulWidget {
  @override
  _AttendanceState createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {

  String getRemark(int per) {
    if(per == 0)
      return 'You are doomed';
    else if(per < 50)
      return 'You need to get serious';
    else if(per<75)
      return 'Don\'t get too lazy';
    else return 'Good Job! keep it up';
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<int>>(
      future: AttendanceHandler().handler(),
      builder: (context, AsyncSnapshot<List<int>> snapshot) {
        return !snapshot.hasData?LoadingAt(): Scaffold(
          appBar: AppBar(
            title : Text("Attendance"),
            backgroundColor : Colors.blue[700],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () async{
              setState(() {});
            },
            child: Icon(Icons.refresh),
            backgroundColor: Colors.blue[700],
          ),
          body: Container(
            child: Column(
              children: <Widget>[
                SizedBox(height: 30,),
               Padding(
                 padding: const EdgeInsets.all(10.0),
                 child: Row(
                   children: <Widget>[
                     Expanded(
                       flex: snapshot.data[2],
                       child: Container(
                         padding: EdgeInsets.fromLTRB(0,25,0,25),
                         color: Colors.green,
                         child: Text(
                            '',
                           style: TextStyle(color: Colors.white,fontSize: 20),
                           textAlign: TextAlign.center,
                         ),
                       ),
                     ),
                     Expanded(
                       flex: 100 - snapshot.data[2],
                       child: Container(
                         padding: EdgeInsets.fromLTRB(0,25,0,25),
                         color: Colors.red,
                         child: Text(
                           '',
                             //'${100 - snapshot.data[2]}%',
                           style: TextStyle(color: Colors.white,fontSize: 20),
                           textAlign: TextAlign.center,
                         ),
                       ),
                     ),
                   ],
                 ),
               ),
                SizedBox(height: 30,),
                Text(
                  '${snapshot.data[2]}%',
                    style: TextStyle(
                      fontSize: 80,
                      fontWeight: FontWeight.bold,
                      color: snapshot.data[2]<50?Colors.red:(snapshot.data[2]<75?Colors.yellow[800]:Colors.green[500])
                    ),
                ),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      '${getRemark(snapshot.data[2])}',
                      style: TextStyle(
                          color: snapshot.data[2]<50?Colors.red:(snapshot.data[2]<75?Colors.yellow[800]:Colors.green[500]),
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'Classes Held: ${snapshot.data[0]}\nClasses Attended: ${snapshot.data[1]}',
                      style: TextStyle(
                        color: Colors.blue[900],
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class LoadingAt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title : Text("Attendance"),
        backgroundColor : Colors.blue[700],
      ),
      body: Container(
        color: Colors.white,
        child: Align(
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              SizedBox(height: 200,),
              SpinKitWave(
                color: Colors.blue[700],
              ),
              SizedBox(height: 20,),
              Text(
                'Behold...',
                style: TextStyle(color: Colors.blue[900]),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
