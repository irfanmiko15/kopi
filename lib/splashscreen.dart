import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:kopi/constant.dart';
import 'package:kopi/mahasiswa/home.dart';
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
        body: Stack(children: [
      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: ColorPalette.backgroundColor,
      ),
      Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
                height: MediaQuery.of(context).size.width * 0.25,
                width: MediaQuery.of(context).size.width * 0.45,
                child: Image.asset(
                  "assets/image/logo.png",
                  fit: BoxFit.fitWidth,
                )),
           
            Container(
      
                child: Image.asset(
              "assets/image/iconsplash.png",fit: BoxFit.fitHeight,
              width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height*0.60,
            )),
          ],
        ),
      ),
    ]));
  }
}
