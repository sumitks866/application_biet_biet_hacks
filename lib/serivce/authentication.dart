import 'package:application_biet_biet_hacks/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //change User to CustomUser
  CustomUser _castToCustom(User user) {
    return user==null?null:CustomUser(uid: user.uid);
  }

  Stream<CustomUser> get users {
     return  _auth.authStateChanges().map(_castToCustom);
  }

  Future login(String email,String password) async {
    try{
        User user = (await _auth.signInWithEmailAndPassword(email: email, password: password)).user;
        return _castToCustom(user);
    }catch(error) {
      print(error.toString());
      return null;
    }
  }
}