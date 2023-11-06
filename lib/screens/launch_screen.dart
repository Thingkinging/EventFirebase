import 'package:events/screens/EventScreen.dart';
import 'package:events/screens/login_screen.dart';
import 'package:events/shared/authentication.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class LaunchScreen extends StatefulWidget {
  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp();
    Authentication auth = Authentication();
    auth.getUser().then((user) {
      MaterialPageRoute route;
      if (user != null) {
        route = MaterialPageRoute(builder: (context) => EventScreen(user.uid));
      }
      else {
        route = MaterialPageRoute(builder: (context) => LoginScreen());
      }
      Navigator.pushReplacement(context, route);
    }).catchError((err)=> print(err));
  }

}