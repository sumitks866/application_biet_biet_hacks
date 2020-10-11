import 'package:application_biet_biet_hacks/models/notice_def.dart';
import 'package:application_biet_biet_hacks/shared/global.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UploadNotice {

  final CollectionReference noticeCollection = FirebaseFirestore.instance.collection('notices');

  Future upload(String subject, String body) async {
    return await noticeCollection.doc().set({
      'subject': subject,
      'body': body,
      'senderID': currActiveStudent.uid,
    });
  }

  List<NoticeModel> _noticeFromSnapshots(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return NoticeModel(
        subject: doc['subject'],
        body: doc['body'],
        senderID: doc['senderID'],
      );
    }).toList();
  }

  Stream<List<NoticeModel>> get notices {
    return noticeCollection.snapshots().map(_noticeFromSnapshots);
  }

}