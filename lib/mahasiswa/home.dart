import 'package:flutter/material.dart';
import 'package:kopi/constant.dart';
import 'package:kopi/login.dart';
import 'package:kopi/mahasiswa/jadwal.dart';
import 'package:kopi/mahasiswa/keluhan.dart';
import 'package:kopi/mahasiswa/komunikasi.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AudioCache _audioKomunikasi, _audioKeluhan, _audioJadwal;

  void widgetKomunikasi() {
    _audioKomunikasi.play('komunikasi.mp3');
    Navigator.push(
        context, MaterialPageRoute(builder: (ctx) => KomunikasiScreen()));
  }

  void widgetKeluhan() {
    _audioKeluhan.play('Keluhan.mp3');
    Navigator.push(context, MaterialPageRoute(builder: (_) => KeluhanScreen()));
  }

  void widgetJadwal() {
    _audioJadwal.play('jadwal.mp3');
    Navigator.push(context, MaterialPageRoute(builder: (_) => JadwalScreen()));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _audioKomunikasi = AudioCache(
        prefix: "audio/",
        fixedPlayer: AudioPlayer()..setReleaseMode(ReleaseMode.STOP));
    _audioKeluhan = AudioCache(
        prefix: "audio/",
        fixedPlayer: AudioPlayer()..setReleaseMode(ReleaseMode.STOP));
    _audioJadwal = AudioCache(
        prefix: "audio/",
        fixedPlayer: AudioPlayer()..setReleaseMode(ReleaseMode.STOP));
  }

  void logout() async{
    SharedPreferences localStorage = await SharedPreferences.getInstance();
        localStorage.remove('role');
        localStorage.remove('id');
        localStorage.remove('token');
    Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (ctx) => LoginScreen()),
              (ctx) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 60,
          backgroundColor: Color(0xFF4DA8E0),
          leading: InkWell(child: Image.asset('assets/image/exitwhite.png'),onTap: (){
            logout();
            
          },),
          actions: <Widget>[
            InkWell(child: Image.asset('assets/image/profil.png')),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: Color(0xFFB8DDFF)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Image.asset(
                  'assets/image/homescreen.png',
                  width: 800,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10, left: 40, right: 40),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 55,
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
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Aku Butuh ...",
                          style: TextStyle(
                              fontFamily: 'Gothic',
                              fontWeight: FontWeight.bold,
                              fontSize: 21),
                        )),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 40, left: 30, right: 30),
                  child: Column(children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        InkWell(
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.38,
                            height: MediaQuery.of(context).size.width * 0.38,
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
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.asset('assets/image/telfon.png'),
                                  Text(
                                    "Komunikasi",
                                    style: TextStyle(
                                        fontFamily: 'Gothic',
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  )
                                ]),
                          ),
                          onTap: () {
                            widgetKomunikasi();
                          },
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.38,
                            height: MediaQuery.of(context).size.width * 0.38,
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
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.asset('assets/image/iconkeluhan.png'),
                                  Text(
                                    "Keluhan",
                                    style: TextStyle(
                                        fontFamily: 'Gothic',
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  )
                                ]),
                          ),
                          onTap: () {
                            widgetKeluhan();
                          },
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.38,
                        height: MediaQuery.of(context).size.width * 0.38,
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset('assets/image/icontanggal.png'),
                              Text(
                                "Jadwal",
                                style: TextStyle(
                                    fontFamily: 'Gothic',
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              )
                            ]),
                      ),
                      onTap: () {
                       widgetJadwal();
                      },
                    )
                  ]),
                )
              ],
            ),
          ),
        ));
  }
}
