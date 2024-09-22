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
    );
  }
}
