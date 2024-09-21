import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_practise2/models/user_model.dart';
import 'package:firebase_practise2/services/auth_service.dart';
import 'package:firebase_practise2/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserModel?>.value(
      initialData: null,
      value: AuthService().onAuthStateChanged,
      builder: (context, snapshot) {
        return MaterialApp(
          title: 'Firebase Practise',
          home: Wrapper(),
        );
      }
    );
  }
}

