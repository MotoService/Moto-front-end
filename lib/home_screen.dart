import 'package:flutter/material.dart';
import 'package:graduation_project/login_screen.dart';
import 'package:graduation_project/signup_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFd4f1f9),
      body: ListView(
        children: [
          Container(
            child: Image(image: AssetImage("assets/logo.png")),
            height: 400,
          ),
          Padding(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF3ebedb),
                      minimumSize: Size(200, 60),
                      maximumSize: Size(200, 60),
                      shape: StadiumBorder(),
                    ),
                    child: Text('Sign In'),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignupScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF3ebedb),
                      minimumSize: Size(200, 60),
                      maximumSize: Size(200, 60),
                      shape: StadiumBorder(),
                    ),
                    child: Text('Sign Up'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
