import 'package:application_biet_biet_hacks/shared/global.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:application_biet_biet_hacks/models/grievance_def.dart';

class UploadGrievances {

  final CollectionReference grievanceCollection = FirebaseFirestore.instance.collection('grievances');

  Future upload(String subject, String body) async {
    return await grievanceCollection.doc().set({
      'subject': subject,
      'body': body,
      'senderID': currActiveStudent.uid,
    });
  }

  List<GrievanceModel> _grievanceFromSnapshots(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return GrievanceModel(
        subject: doc['subject'],
        body: doc['body'],
        senderID: doc['senderID'],
      );
    }).toList();
  }

  Stream<List<GrievanceModel>> get grievances {
    return grievanceCollection.snapshots().map(_grievanceFromSnapshots);
  }

}