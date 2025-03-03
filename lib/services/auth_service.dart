import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_practise2/models/user_model.dart';
import 'package:firebase_practise2/screens/home/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
  // auth change user stream
  Stream<UserModel?> get onAuthStateChanged{
    return _auth.authStateChanges()
    //.map((User? user) => _userFromFirebase(user));
        .map(_userFromFirebase);
  }

  Future signOut()async{
    try {
      return await _auth.signOut();
    }  catch (e) {
      // TODO
      print(e.toString());
    }
  }
  Future signInWithEmailAndPassword(String email ,String password,BuildContext context)async{
   try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home(),));
   } catch (e) {
     // TODO
     print(e.toString());
     return null;
   }
  }




  ////////////////////////////////////////////////////////////////////////

  Future signUpWithEmailAndPassword(String email ,String password)async{
   try {
     return await _auth.createUserWithEmailAndPassword(email: email, password: password);
   } catch (e) {
     // TODO
     print(e.toString());
     return null;
   }
  }
verifyEmail(){
    _auth.currentUser!.sendEmailVerification();
}




}