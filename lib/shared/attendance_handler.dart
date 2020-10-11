import 'package:application_biet_biet_hacks/shared/global.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AttendanceHandler {
  final CollectionReference attendanceRef = FirebaseFirestore.instance.collection('attendance');
  Future<List<int>> handler() async{
    List<int> data = new List(3);
    DocumentSnapshot snapshot = await attendanceRef.doc(currActiveStudent.uid).get();
    data[0] = snapshot.data()['total'];
    data[1] = snapshot.data()['attended'];
    double p = (data[1]/data[0])*100;
    data[2] = p.toInt();
    if(snapshot.data()==null)
      return null;
    return data;
  }
}