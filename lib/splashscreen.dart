import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kopi/home.dart';
import 'package:kopi/login.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  bool isLoading = false;
  bool isLoggedIn = false;
 

  String id = '';

  startTime() async {
    var _duration = new Duration(seconds: 8);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() async {
    this.setState(() {
      isLoading = true;
    });

    // prefs = await SharedPreferences.getInstance();

    // isLoggedIn = await googleSignIn.isSignedIn();
    // if (isLoggedIn) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ),
          (ctx) => false);
    // } else {
    //   Navigator.of(context).pushReplacementNamed('/IntroSlider');
    // }

    this.setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();

    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
          child: Container(
        decoration: new BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/image/splash.png'),
            fit: BoxFit.cover,
          ),
        ),
      )),
    );
  }
}