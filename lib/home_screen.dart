import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graduation_project/login_screen.dart';
import 'package:graduation_project/request_screen.dart';
import 'package:graduation_project/signup_screen.dart';
import 'package:location/location.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late bool _serviceEnabled;

  late PermissionStatus _permissionGranted;

  @override
  void initState() {
    super.initState();
    CheckLocationServicesInDevice();
  }

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
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RequestScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF3ebedb),
                      minimumSize: Size(200, 60),
                      maximumSize: Size(200, 60),
                      shape: StadiumBorder(),
                    ),
                    child: Text('maps Test'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> CheckLocationServicesInDevice() async {
    Location location = Location();

    _serviceEnabled = await location.serviceEnabled();
///////////////////////////////////////////////////////////////////////////////////////////////
///////////////////<<<< if we have GPS enabled and permission before >>>>//////////////////////
    //if true (GBS enabled)
    if (_serviceEnabled) {
      //will check for permission status
      _permissionGranted = await location.hasPermission();
      //if we have permission before from cache (== granted)
      if (_permissionGranted == PermissionStatus.granted) {
///////////////////////////////////////////////////////////////////////////////////////////////
//////////////////<<<< if we have GPS enabled but we don't have permission >>>>////////////////
      } else {
        _permissionGranted = await location.requestPermission();
        //if we don't have permission before will ask for it
        if (_permissionGranted == PermissionStatus.granted) {
        } else {
          SystemNavigator.pop();
        }
      }
///////////////////////////////////////////////////////////////////////////////////////////////
/////////////////<<<< if GPS disabled but we have permission before >>>>///////////////////////
    } else {
      //if GBS turned off will ask user to activate it by press ok
      _serviceEnabled = await location.requestService();
      if (_serviceEnabled) {
        //if we pressed ok system will turn on GBS and continue
        //will check for permission status
        _permissionGranted = await location.hasPermission();
        //if we have permission before from cache (== granted)
        if (_permissionGranted == PermissionStatus.granted) {
///////////////////////////////////////////////////////////////////////////////////////////////
//////////////////<<<< if GPS disabled and we don't have permission before >>>>////////////////
        } else {
          //if we don't have a permission will ask for it
          _permissionGranted = await location.requestPermission();
          if (_permissionGranted == PermissionStatus.granted) {
          } else {
            SystemNavigator.pop();
          }
        }
///////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////
      } else {
        //if we didn't get the access then close the application
        SystemNavigator.pop();
      }
    }
  }
}
