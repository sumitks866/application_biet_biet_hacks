import 'package:application_biet_biet_hacks/models/student_def.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

StudentData currActiveStudent;
CollectionReference studentRecord = FirebaseFirestore.instance.collection('students');

StudentData fetchData(DocumentSnapshot snapshot, String uid) {
  return StudentData(
      name:snapshot.data()['name']==null?'not set':snapshot.data()['name'],
      rollNumber:snapshot.data()['rollNumber']==null?'not set':snapshot.data()['rollNumber'],
      branch:snapshot.data()['branch']==null?'not set':snapshot.data()['branch'],
      gender:snapshot.data()['gender']==null?'not set':snapshot.data()['gender'],
      category:snapshot.data()['category']==null?'not set':snapshot.data()['category'],
      email:snapshot.data()['email']==null?'not set':snapshot.data()['email'],
      father:snapshot.data()['father']==null?'not set':snapshot.data()['father'],
      mother:snapshot.data()['mother']==null?'not set':snapshot.data()['mother'],
      uid: uid,
  );
}

Future<StudentData> initData() async {
  final String uid = FirebaseAuth.instance.currentUser.uid;
  try {
    DocumentSnapshot snapshot = await studentRecord.doc(uid).get();
    //print("the data -------------------> " + uid);
    currActiveStudent = fetchData(snapshot, uid);
  }catch(error) {
    print(error.toString());
  }
  //currActiveStudent = sanitize(currActiveStudent);
  return currActiveStudent;
}