import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../services/auth_service.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Home"),
        actions: [
          TextButton(
            onPressed: () async {
              _authService.signOut();
            },
            child: Text("Sign out"),
          )
        ],
      ),
      body: FirebaseAuth.instance.currentUser!.emailVerified
          ? Center(child: Text("Welcome To your verified Account "))
          : Column(
        children: [
          Center(
            child: MaterialButton(
              onPressed: () {
                FirebaseAuth.instance.currentUser!.sendEmailVerification();
              },
              color: Colors.red,
              textColor: Colors.white,
              child: Text("Verify"),
            ),
          )
        ],
      ),
    );
  }
}
