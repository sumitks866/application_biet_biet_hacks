import 'package:application_biet_biet_hacks/shared/global.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:application_biet_biet_hacks/models/news_def.dart';

class UploadNews {

  final CollectionReference newsCollection = FirebaseFirestore.instance.collection('tandpnews');

  Future upload(String subject, String body) async {
    return await newsCollection.doc().set({
      'subject': subject,
      'body': body,
      'senderID': currActiveStudent.uid,
    });
  }

  List<NewsModel> _castToCustom(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return NewsModel(
        subject: doc['subject'],
        body: doc['body'],
        senderID: doc['senderID'],
      );
    }).toList();
  }

  Stream<List<NewsModel>> get news {
    return newsCollection.snapshots().map(_castToCustom);
  }

}