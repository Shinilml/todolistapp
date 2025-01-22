import 'package:flutter/material.dart';
import 'package:todolistappexm/utils/colorconstants.dart';
import 'package:todolistappexm/view/homescreen/homescreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to the home screen after 5 seconds
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Homescreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorconstants.brown,
      body: Center(
        child: Icon(
          Icons.assignment,
          size: 100,
          color: Colorconstants.white,
        ),
      ),
    );
  }
}
