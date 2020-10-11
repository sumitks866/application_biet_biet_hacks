import 'package:application_biet_biet_hacks/serivce/upload_grievances.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:application_biet_biet_hacks/models/grievance_def.dart';

class ShowGrievances extends StatefulWidget {
  @override
  _ShowGrievancesState createState() => _ShowGrievancesState();
}

class _ShowGrievancesState extends State<ShowGrievances> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<GrievanceModel>>.value(
      value: UploadGrievances().grievances,
      child: Container(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromRGBO(2, 52, 130, 1),
            title:  Text("Grievances Redressal", style: TextStyle(color : Colors.white),),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: (){
              Navigator.pushNamed(context, '/grievancesform');
            },
            child: Icon(Icons.add),
            backgroundColor: Colors.red[700],
          ),
          body: GrievancesList(),
        ),
      ),
    );
  }
}

class GrievancesList extends StatefulWidget {
  @override
  _GrievancesListState createState() => _GrievancesListState();
}

class _GrievancesListState extends State<GrievancesList> {
  @override
  Widget build(BuildContext context) {
    final grievances = Provider.of<List<GrievanceModel>>(context)??[];
    return ListView.builder(
        itemCount: grievances.length,
        itemBuilder: (context,index) {
          return GrievanceTile(grievance: grievances[index],);
        }
    );
  }
}

class GrievanceTile extends StatefulWidget {
  final GrievanceModel grievance;
  GrievanceTile({this.grievance});

  @override
  _GrievanceTileState createState() => _GrievanceTileState();
}

class _GrievanceTileState extends State<GrievanceTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 6.0),
      child: Card(
        color:Colors.red[50],
        margin: EdgeInsets.fromLTRB(20, 10,20,10),
        child: Padding(
          padding: EdgeInsets.all(5),
          child: ListTile(
            title: Text(widget.grievance.subject),
            subtitle: Text(widget.grievance.body),
          ),
        ),
      ),
    );
  }
}
