import 'package:firebase_practise2/services/auth_service.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  AuthService _authService =AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In Page"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: ElevatedButton(
            onPressed: () async{
              dynamic result=await _authService.signInAnonymous();
            },
            child: Text(
              'Sign in',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
