import 'package:firebase_practise2/screens/authenticate/sign_in.dart';
import 'package:flutter/material.dart';

import '../../services/auth_service.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
          TextFormField(decoration: InputDecoration(label: Text("Name")),),
          TextFormField(controller:emailController ,),
          TextFormField(controller:passwordController ,),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
            child: ElevatedButton(
              onPressed: () async{
                dynamic result=await _authService.signUpWithEmailAndPassword(emailController.text, passwordController.text);
                print(result);
              },
              child: Text(
                'Sign Up',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
          SizedBox(height: 40,),
          TextButton(onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignIn(),),);
          }, child: Text("I have an account"),),
        ],
      ),
    );
  }
}
