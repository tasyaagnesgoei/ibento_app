import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ibento_app/pages/signin_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 4), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SignInScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset("assets/background.png"),
          Image.asset(
            "assets/ibento_logo.png",
            width: 250,
            height: 250,
          ),
        ],
      ),
    );
  }
}
