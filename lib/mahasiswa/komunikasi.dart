import 'package:flutter/material.dart';
import 'package:kopi/mahasiswa/uasmahasiswa.dart';
import 'package:kopi/mahasiswa/utsmahasiswa.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:kopi/mahasiswa/home.dart';

class KomunikasiScreen extends StatefulWidget {
  @override
  _KomunikasiScreenState createState() => _KomunikasiScreenState();
}

class _KomunikasiScreenState extends State<KomunikasiScreen> {
  AudioCache _audioUTS, _audioUAS;
  void widgetUTS() async {
    SharedPreferences localPreference = await SharedPreferences.getInstance();
    bool getSound = localPreference.getBool('sound');
    if (getSound == true) {
      _audioUTS.play('UjianTengahSemester.mp3');
      Navigator.push(
          context, MaterialPageRoute(builder: (ctx) => UTSMahasiswa()));
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (ctx) => UTSMahasiswa()));
    }
  }

  void widgetUAS() async {
    SharedPreferences localPreference = await SharedPreferences.getInstance();
    bool getSound = localPreference.getBool('sound');
    if (getSound == true) {
      _audioUAS.play('UjianAkhirSemester.mp3');
      Navigator.push(
          context, MaterialPageRoute(builder: (ctx) => UASMahasiswa()));
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (ctx) => UASMahasiswa()));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _audioUTS = AudioCache(
        prefix: "audio/",
        fixedPlayer: AudioPlayer()..setReleaseMode(ReleaseMode.STOP));
    _audioUAS = AudioCache(
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
        title: Text('Komunikasi', style: TextStyle(fontFamily: 'Gothic')),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: (){
                Navigator.push(
                      context, MaterialPageRoute(builder: (ctx) => HomeScreen()));
            },
            child: Container(child: Image.asset("assets/image/homewhite1.png")),
          )
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(color: Color(0xFFB8DDFF)),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Image.asset(
                'assets/image/bertanya.png',
                height: 200,
              ),
              InkWell(
                child: Padding(
                    padding: EdgeInsets.only(right: 25, left: 25),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFF1D6297).withOpacity(0.1),
                            spreadRadius: 2,
                            blurRadius: 4,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                              flex: 1,
                              child: Image.asset(
                                'assets/image/utsblue.png',
                                height: 70,
                              )),
                          Expanded(
                              flex: 2,
                              child: Text(
                                "Ujian Tengah Semester",
                                style: TextStyle(
                                    fontFamily: 'Gothic',
                                    fontWeight: FontWeight.bold),
                              ))
                        ],
                      ),
                    )),
                onTap: () {
                  widgetUTS();
                },
              ),
              InkWell(
                  child: Padding(
                      padding: EdgeInsets.only(top: 25, right: 25, left: 25),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
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
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                                flex: 1,
                                child: Image.asset(
                                  'assets/image/uasblue.png',
                                  height: 70,
                                )),
                            Expanded(
                                flex: 2,
                                child: Text(
                                  "Ujian Akhir Semester",
                                  style: TextStyle(
                                      fontFamily: 'Gothic',
                                      fontWeight: FontWeight.bold),
                                ))
                          ],
                        ),
                      )),
                  onTap: () {
                    widgetUAS();
                  })
            ]),
      ),
    );
  }
}
