import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  final FirebaseAuth _auth =FirebaseAuth.instance;

  Future signInAnonymous()async{
    try {
      UserCredential result = await _auth.signInAnonymously();
      User ?user=result.user;
      return user;
    } catch (e) {
      // TODO
      print(e.toString());
    }
  }


}