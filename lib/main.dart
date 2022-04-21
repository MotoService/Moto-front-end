import 'package:flutter/material.dart';
import 'package:graduation_project/home_screen.dart';
import 'package:graduation_project/login_screen.dart';
import 'package:graduation_project/signup_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      title: 'graduation project',
      routes: {
        'home': (context) => HomeScreen(),
        'login': (context) => LoginScreen(),
        'signup': (context) => SignupScreen(),
      },
    ),
  );
}
