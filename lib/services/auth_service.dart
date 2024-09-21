import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_practise2/models/user_model.dart';

class AuthService{
  final FirebaseAuth _auth =FirebaseAuth.instance;

  Future signInAnonymous()async{
    try {
      UserCredential result = await _auth.signInAnonymously();
      User ?user=result.user;
      return _userFromFirebase(user);
    } catch (e) {
      // TODO
      print(e.toString());
    }
  }
UserModel? _userFromFirebase(User? user){
    if(user != null){
     return UserModel(uid: user.uid);
    }else{
      return null;
    }
}

}