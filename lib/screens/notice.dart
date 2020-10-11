import 'package:application_biet_biet_hacks/models/notice_def.dart';

import 'package:application_biet_biet_hacks/serivce/upload_notification.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class Notice extends StatefulWidget {
  @override
  _NoticeState createState() => _NoticeState();
}

class _NoticeState extends State<Notice> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<NoticeModel>>.value(
      value: UploadNotice().notices,
      child: Container(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue[700],
            title:  Text("Notices", style: TextStyle(color : Colors.white),),
          ),
          
          // floatingActionButton: FloatingActionButton(
          //   onPressed: (){
          //     Navigator.pushNamed(context, '/noticesform');
          //   },
          //   child: Icon(Icons.add),
          //   backgroundColor: Colors.red[700],
          // ),
          body: NoticesList(),
        ),
      ),
    );
  }
}

class NoticesList extends StatefulWidget {
  @override
  _NoticesListState createState() => _NoticesListState();
}

class _NoticesListState extends State<NoticesList> {
  @override
  Widget build(BuildContext context) {
    final notices = Provider.of<List<NoticeModel>>(context)??[];
    return ListView.builder(
        itemCount: notices.length,
        itemBuilder: (context,index) {
          return NoticeTile(notice: notices[index],);
        }
    );
  }
}

class NoticeTile extends StatefulWidget {
  final NoticeModel notice;
  NoticeTile({this.notice});

  @override
  _NoticeTileState createState() => _NoticeTileState();
}

class _NoticeTileState extends State<NoticeTile> {
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
            title: Text(widget.notice.subject),
            subtitle: Text(widget.notice.body),
          ),
        ),
      ),
    );
  }
}