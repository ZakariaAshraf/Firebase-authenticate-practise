import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_practise2/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignIn extends StatefulWidget {
   SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailController =TextEditingController();
  TextEditingController passwordController =TextEditingController();
  AuthService _authService =AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In Page"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TextFormField(controller:emailController ,),
          TextFormField(controller:passwordController ,),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
            child: ElevatedButton(
              onPressed: () async{
                dynamic result=await _authService.signInWithEmailAndPassword(emailController.text, passwordController.text,context);
                print(result);

              },
              child: Text(
                'Sign in',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
            child: ElevatedButton(
              onPressed: () {
                },
              child: Text(
                'Sign in With Google',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
