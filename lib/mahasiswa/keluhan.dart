import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

class KeluhanScreen extends StatefulWidget {
  @override
  _KeluhanScreenState createState() => _KeluhanScreenState();
}

class _KeluhanScreenState extends State<KeluhanScreen> {
  AudioCache _audioPendamping;
  _callNumberPendamping() async {
    const number = '08993950031'; //set the number here
    bool res = await FlutterPhoneDirectCaller.callNumber(number);
  }
  audio() {
    _audioPendamping.play('Pendamping.mp3');
  }

  Future<void> pendamping() {
    audio();
    // Imagine that this function is fetching user info from another service or database.
    return Future.delayed(Duration(seconds: 3), () => _callNumberPendamping());
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _audioPendamping = AudioCache(
        prefix: "audio/",
        fixedPlayer: AudioPlayer()..setReleaseMode(ReleaseMode.STOP));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 60,
          backgroundColor: Color(0xFF4DA8E0),
          title: Text('Keluhan', style: TextStyle(fontFamily: 'Gothic')),
          centerTitle: true,
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(color: Color(0xFFB8DDFF)),
          child: ListView(children: <Widget>[
            Image.asset(
              'assets/image/keluh.png',
              height: 200,
            ),
            Padding(
              padding: EdgeInsets.only(left: 25, right: 25),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height),
                child: GridView(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.9, crossAxisCount: 2),
                  children: [
                    InkWell(
                      child: Container(
                        margin: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(35),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFF1D6297).withOpacity(0.1),
                              spreadRadius: 2,
                              blurRadius: 4,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                'assets/image/bookblue.png',
                                height: 80,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Akademik",
                                style: TextStyle(
                                    fontFamily: 'Gothic',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              )
                            ]),
                      ),
                      onTap: () {
                       
                      },
                    ),
                    InkWell(
                      child: Container(
                        margin: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(35),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFF1D6297).withOpacity(0.1),
                              spreadRadius: 2,
                              blurRadius: 4,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                'assets/image/psikologblue.png',
                                height: 80,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Psikolog",
                                style: TextStyle(
                                    fontFamily: 'Gothic',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              )
                            ]),
                      ),
                      onTap: () {
                        
                      },
                    ),
                    InkWell(
                      child: Container(
                        margin: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(35),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFF1D6297).withOpacity(0.1),
                              spreadRadius: 2,
                              blurRadius: 4,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                'assets/image/admblue.png',
                                height: 80,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Administrasi",
                                style: TextStyle(
                                    fontFamily: 'Gothic',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              )
                            ]),
                      ),
                      onTap: () async {
                        await audio();
                      },
                    ),
                    InkWell(
                      child: Container(
                        margin: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(35),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFF1D6297).withOpacity(0.1),
                              spreadRadius: 2,
                              blurRadius: 4,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                'assets/image/keamananblue.png',
                                height: 80,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Keamanan",
                                style: TextStyle(
                                    fontFamily: 'Gothic',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              )
                            ]),
                      ),
                      onTap: () {
                       
                      },
                    ),
                    InkWell(
                      child: Container(
                        margin: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(35),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFF1D6297).withOpacity(0.1),
                              spreadRadius: 2,
                              blurRadius: 4,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                'assets/image/pendampingblue.png',
                                height: 80,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Pendamping",
                                style: TextStyle(
                                    fontFamily: 'Gothic',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              )
                            ]),
                      ),
                      onTap: () {
                        pendamping();
                      },
                    ),
                  ],
                ),
              ),
            )
          ]),
        ));
  }
}
