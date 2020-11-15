import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:kopi/constant.dart';
import 'package:kopi/dosen/homedosen.dart';
import 'package:flutter/rendering.dart';
import 'package:kopi/mahasiswa/home.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FirebaseMessaging firebaseMessaging = new FirebaseMessaging();
   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      new FlutterLocalNotificationsPlugin();
  coba()async{
      firebaseMessaging.getToken().then((token) async {
       var pushtoken = token.toString();
        firebaseMessaging.requestNotificationPermissions();
    firebaseMessaging.configure(onMessage: (Map<String, dynamic> message) {
      print('onMessage: $message');
      showNotification(message['notification']);
      return;
    }, onResume: (Map<String, dynamic> message) {
      print('onResume: $message');
      showNotification(message['notification']);
      return;
    }, onLaunch: (Map<String, dynamic> message) {
      print('onLaunch: $message');
      showNotification(message['notification']);
      return;
    });
      print("coba");
      print("coba: $pushtoken");
      });
  }
   void configLocalNotification() async {
    var initializationSettingsAndroid =
        new AndroidInitializationSettings('ic_launcher');
    var initializationSettingsIOS = new IOSInitializationSettings();
    var initializationSettings = new InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);
    flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }
   void showNotification(message) async {
    var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
      Platform.isAndroid ? 'com.komunikasi.kopi' : 'com.komunikasi.kopi',
      'Kopi',
      'your channel description',
      playSound: true,
      enableVibration: true,
      importance: Importance.Max,
      priority: Priority.High,
    );
    var iOSPlatformChannelSpecifics = new IOSNotificationDetails();
    var platformChannelSpecifics = new NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(0, message['title'].toString(),
        message['body'].toString(), platformChannelSpecifics,
        payload: json.encode(message));
  }
  @override
  void initState() {
    // TODO: implement initState
    coba();
    configLocalNotification();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: new Center(
            child: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: ColorPalette.backgroundColor,
      child: Column(children: <Widget>[
        Expanded(
            child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: <Widget>[
            Container(
                alignment: Alignment.bottomCenter,
                child: Image.asset(
                  "assets/image/loginbottom.png",
                  width: MediaQuery.of(context).size.width,
                )),
            Center(
                child: ListView(children: <Widget>[
            InkWell(
              child:Padding(
                padding: EdgeInsets.only(top: 70.0),
                child: Image.asset("assets/image/logo.png",
                    height: 200.0, width: 200.0),
              ),
              onTap: (){
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                builder: (ctx) => HomeDosen()
              ), (ctx) => false);
              },
              ),
              Padding(
                padding: EdgeInsets.only(top: 0, bottom: 10),
                child: Text(
                  "Halaman Masuk",
                  style: TextStyle(color: Colors.black, fontSize: 17),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                  margin: EdgeInsets.only(left: 30, right: 30),
                  width: MediaQuery.of(context).size.width,
                  height: 48.0,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 0.3,
                          blurRadius: 2,
                          offset: Offset(2, 3),
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: TextField(
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      style: TextStyle(color: Colors.grey[600]),
                      textInputAction: TextInputAction.done,
                      decoration: new InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          contentPadding:
                              EdgeInsets.only(bottom: 11, top: 11, right: 15),
                          hintText: "Username",
                          hintStyle: TextStyle(
                              color: Colors.grey[600], fontSize: 15.0)),
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
              Container(
                  margin: EdgeInsets.only(left: 30, right: 30),
                  width: MediaQuery.of(context).size.width,
                  height: 48.0,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 0.3,
                          blurRadius: 2,
                          offset: Offset(2, 3),
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: TextField(
                      obscureText: true,
                     
                      keyboardType: TextInputType.multiline,
                      style: TextStyle(color: Colors.grey[600]),
                      textInputAction: TextInputAction.done,
                      decoration: new InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          contentPadding:
                              EdgeInsets.only(bottom: 11, top: 11, right: 15),
                          hintText: "Password",
                          hintStyle: TextStyle(
                              color: Colors.grey[600], fontSize: 15.0)),
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
              InkWell(
                child: Container(
                  margin: EdgeInsets.only(left:100,right:100),
                  
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: ColorPalette.primaryDarkColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.all(15),
                  child: Text(
                    "Masuk",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                },
              ),
            ])),
          ],
        )),
      ]),
    )));
  }
}
