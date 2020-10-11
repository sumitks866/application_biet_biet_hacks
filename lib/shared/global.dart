import 'package:application_biet_biet_hacks/models/student_def.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

StudentData currActiveStudent;
CollectionReference studentRecord = FirebaseFirestore.instance.collection('students');
String ProfilePicUrl;

StudentData fetchData(DocumentSnapshot snapshot, String uid) {
  return StudentData(
      name:snapshot.data()==null?'not set':snapshot.data()['name'],
      rollNumber:snapshot.data()==null?'not set':snapshot.data()['rollNumber'],
      branch:snapshot.data()==null?'not set':snapshot.data()['branch'],
      gender:snapshot.data()==null?'not set':snapshot.data()['gender'],
      category:snapshot.data()==null?'not set':snapshot.data()['category'],
      email:snapshot.data()==null?'not set':snapshot.data()['email'],
      father:snapshot.data()==null?'not set':snapshot.data()['father'],
      mother:snapshot.data()==null?'not set':snapshot.data()['mother'],
      uid: uid,
  );
}

Future<StudentData> initData() async {
  final String uid = FirebaseAuth.instance.currentUser.uid;
  DocumentSnapshot snapshot = await studentRecord.doc(uid).get();
  currActiveStudent = fetchData(snapshot, uid);
  try {
    ProfilePicUrl = (await FirebaseStorage.instance.ref().child("${currActiveStudent.rollNumber}.jpg").getDownloadURL()).toString();
    print(ProfilePicUrl);
  }catch(error) {
    print(error.toString());
    ProfilePicUrl = null;
  }
  return currActiveStudent;
}