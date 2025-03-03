import 'package:firebase_practise2/models/user_model.dart';
import 'package:firebase_practise2/screens/authenticate/authenticate.dart';
import 'package:firebase_practise2/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userModel=Provider.of<UserModel?>(context);
    if(userModel==null){
      return const Authenticate();
    }else{
      return Home();
    }
  }
}
