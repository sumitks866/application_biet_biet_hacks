import 'package:application_biet_biet_hacks/serivce/upload_tandpnews.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:application_biet_biet_hacks/models/news_def.dart';

class ShowNews extends StatefulWidget {
  @override
  _ShowNewsState createState() => _ShowNewsState();
}

class _ShowNewsState extends State<ShowNews> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<NewsModel>>.value(
      value: UploadNews().news,
      child: Container(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue[700],
            title:  Text("Training and Placement", style: TextStyle(color : Colors.white),),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: (){
              Navigator.pushNamed(context, '/tandp_form');
            },
            child: Icon(Icons.new_releases),
            backgroundColor: Colors.green[700],
          ),
          body: NewsList(),
        ),
      ),
    );
  }
}

class NewsList extends StatefulWidget {
  @override
  _NewsListState createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  @override
  Widget build(BuildContext context) {
    final news = Provider.of<List<NewsModel>>(context)??[];
    return ListView.builder(
        itemCount: news.length,
        itemBuilder: (context,index) {
          return NewsTile(news: news[index],);
        }
    );
  }
}

class NewsTile extends StatefulWidget {
  final NewsModel news;
  NewsTile({this.news});

  @override
  _NewsTileState createState() => _NewsTileState();
}

class _NewsTileState extends State<NewsTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 6.0),
      child: Card(
        color:Colors.green[50],
        margin: EdgeInsets.fromLTRB(20, 10,20,10),
        child: Padding(
          padding: EdgeInsets.all(5),
          child: ListTile(
            title: Text(widget.news.subject),
            subtitle: Text(widget.news.body),
          ),
        ),
      ),
    );
  }
}
