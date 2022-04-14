import 'package:flutter/material.dart';
import 'package:graduation_project/login_screen.dart';
import 'package:graduation_project/signup_screen.dart';
void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'signup',
      title: 'graduation project',
      routes: {
        'login': (context) => LoginScreen(),
        'signup': (context) => SignupScreen(),
      },
    ),
  );
}
