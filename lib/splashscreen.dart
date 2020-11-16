import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:kopi/constant.dart';
import 'package:kopi/dosen/homedosen.dart';
import 'package:kopi/mahasiswa/home.dart';
import 'package:kopi/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

    SharedPreferences localStorage = await SharedPreferences.getInstance();
    localStorage.getString('role');
    localStorage.getString('id');

    if (localStorage.getString('id') != null) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ),
          (ctx) => false);
          if(localStorage.getString('role')=="1"){
             Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (ctx) => HomeScreen()),
              (ctx) => false);

          }
          else{
             Navigator.pushAndRemoveUntil(context,
              MaterialPageRoute(builder: (ctx) => HomeDosen()), (ctx) => false);
          }
    }
    else{
       Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ),
          (ctx) => false);
    }

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
              "assets/image/iconsplash.png",
              fit: BoxFit.fitHeight,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.60,
            )),
          ],
        ),
      ),
    ]));
  }
}
