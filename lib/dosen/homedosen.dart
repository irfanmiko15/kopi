import 'package:flutter/material.dart';
import 'package:kopi/dosen/keluhandosen.dart';
import 'package:kopi/dosen/pesanmasuk.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../login.dart';
import 'jadwaldosen.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: HomeDosen()));
}

class HomeDosen extends StatefulWidget {
  @override
  _HomeDosenState createState() => _HomeDosenState();
}


class _HomeDosenState extends State<HomeDosen> {
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
          leading: InkWell(
            onTap: (){logout();},
            child: Image.asset('assets/image/exitwhite.png')),
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
                            ),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.asset('assets/image/komunikasi.png',height: MediaQuery.of(context).size.height*0.1,),
                                  Text(
                                    "Pesan Masuk",
                                    style: TextStyle(
                                        fontFamily: 'Gothic',
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  )
                                ]),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (ctx) => PesanMasuk()));
                          },
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (ctx) => KeluhanDosen()));
                          },
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
                                  Image.asset('assets/image/keluhan.png',height: MediaQuery.of(context).size.height*0.1,),
                                  Text(
                                    "Keluhan",
                                    style: TextStyle(
                                        fontFamily: 'Gothic',
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  )
                                ]),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                     InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (ctx) => JadwalDosen()));
                          },
                          child:
                    Container(
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
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset('assets/image/jadwal.png',height: MediaQuery.of(context).size.height*0.1,),
                            Text(
                              "Jadwal",
                              style: TextStyle(
                                  fontFamily: 'Gothic',
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            )
                          ]),
                    ),)
                  ]),
                )
              ],
            ),
          ),
        ));
  }
}
