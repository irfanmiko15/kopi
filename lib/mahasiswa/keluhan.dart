import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class KeluhanScreen extends StatefulWidget {
  @override
  _KeluhanScreenState createState() => _KeluhanScreenState();
}

class _KeluhanScreenState extends State<KeluhanScreen> {
  AudioCache _audio;
  bool _isLoading;
  loading() {
    setState(() {
      _isLoading = false;
    });
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
            content: Container(
                margin: EdgeInsets.all(10),
                child: Row(
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(width: 10),
                    Text("Loading...")
                  ],
                )));
      },
      barrierDismissible: false,
    );
  }

  _callNumberPendamping() async {
    const number = '08993950031'; //set the number here
    bool res = await FlutterPhoneDirectCaller.callNumber(number);
  }
   _callNumberKeamanan() async {
    const number = '089615224650'; //set the number here
    bool res = await FlutterPhoneDirectCaller.callNumber(number);
  }
  _callNumberPsikologi() async {
    const number = '081229010188'; //set the number here
    bool res = await FlutterPhoneDirectCaller.callNumber(number);
  }
  _callNumberAkademik() async {
    const number = '089685290801'; //set the number here
    bool res = await FlutterPhoneDirectCaller.callNumber(number);
  }

  _callNumberAdministrasi()async{
    const number = '085850933313';
    bool res = await FlutterPhoneDirectCaller.callNumber(number);
  }

  audioPendampingan() {
    _audio.play('Pendamping.mp3');
  }

  audioKemanan() {
    _audio.play('Keamanan.mp3');
  }

  audioPsikologi() {
    _audio.play('Psikolog.mp3');
  }

  audioAkademik() {
    _audio.play('Akademik.mp3');
  }

  Future<void> pendamping() async {
    setState(() {
      _isLoading = true;
    });
    loading();
    SharedPreferences localPreference = await SharedPreferences.getInstance();
    bool getSound = localPreference.getBool('sound');
    if (getSound == true) {
      audioPendampingan();
      // Imagine that this function is fetching user info from another service or database.
      Future.delayed(Duration(seconds: 3), () => _callNumberPendamping()).then((value) =>  Navigator.of(context).pop());
      setState(() {
        _isLoading = false;
      });
    } else {
      Future.delayed(Duration(seconds: 3), () => _callNumberPendamping()).then((value) =>  Navigator.of(context).pop());
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> keamanan() async {
    setState(() {
      _isLoading = true;
    });
    loading();
    SharedPreferences localPreference = await SharedPreferences.getInstance();
    bool getSound = localPreference.getBool('sound');
    if (getSound == true) {
      audioKemanan();
      Future.delayed(Duration(seconds: 3), () => _callNumberKeamanan()).then((value) =>  Navigator.of(context).pop());
      setState(() {
        _isLoading = false;
      });
    } else {
      Future.delayed(Duration(seconds: 3), () => _callNumberKeamanan()).then((value) =>  Navigator.of(context).pop());
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> psikologi() async {
    setState(() {
      _isLoading = true;
    });
    
    SharedPreferences localPreference = await SharedPreferences.getInstance();
    bool getSound = localPreference.getBool('sound');
    if (getSound == true) {
      
      Future.delayed(Duration(seconds: 3), () => _callNumberPsikologi().then((value) =>  Navigator.of(context).pop()));
      
      setState(() {
        _isLoading = false;
      });
    } else {
      
      Future.delayed(Duration(seconds: 3), () => _callNumberPsikologi().then((value) =>  Navigator.of(context).pop()));
      
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> akademik() async {
    setState(() {
      _isLoading = true;
    });
    loading();
    SharedPreferences localPreference = await SharedPreferences.getInstance();
    bool getSound = localPreference.getBool('sound');
    if (getSound == true) {
      audioAkademik();
      Future.delayed(Duration(seconds: 3), () => _callNumberAkademik()).then((value) =>  Navigator.of(context).pop());
      setState(() {
        _isLoading = false;
      });
    } else {
      Future.delayed(Duration(seconds: 3), () => _callNumberAkademik()).then((value) =>  Navigator.of(context).pop());
      setState(() {
        _isLoading = false;
      });
    }
  }
  Future<void> administrasi()async{
    setState(() {
      _isLoading = true;
    });
    loading();
    SharedPreferences localPreference = await SharedPreferences.getInstance();
    bool getSound = localPreference.getBool('sound');
    if (getSound == true) {
      audioAkademik();
      Future.delayed(Duration(seconds: 3), () => _callNumberAdministrasi()).then((value) =>  Navigator.of(context).pop());
       
      setState(() {
        _isLoading = false;
      });
    } else {
      Future.delayed(Duration(seconds: 3), () => _callNumberAdministrasi()).then((value) =>  Navigator.of(context).pop());
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _audio = AudioCache(
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
                        akademik();
                        
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
                        loading();
                        psikologi();
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
                          administrasi();
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
                        keamanan();
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
