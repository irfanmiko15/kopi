import 'package:flutter/material.dart';
import 'package:kopi/constant.dart';

class JadwalSemesterIniScreen extends StatefulWidget {
  @override
  _JadwalSemesterIniScreenState createState() =>
      _JadwalSemesterIniScreenState();
}

class _JadwalSemesterIniScreenState extends State<JadwalSemesterIniScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 60,
        backgroundColor: ColorPalette.appbarColor,
        title: Text("Jadwal"),
        centerTitle: true,
        actions: <Widget>[
          InkWell(child: Image.asset('assets/image/profil.png')),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: ColorPalette.backgroundColor,
        child: Column(
          children: [
            InkWell(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.25,
                height: MediaQuery.of(context).size.width * 0.25,
                child: Image.asset(
                  'assets/image/icontanggal.png',
                  fit: BoxFit.contain,
                ),
              ),
              onTap: () {},
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: 40, right: 40, top: 10, bottom: 20),
              child: Container(
                padding: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
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
                      "Jadwal Perkuliahan",
                      style: TextStyle(
                          fontFamily: 'Gothic',
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    )),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(left: 40, right: 40),
              padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: Container(
                          child: Text("Pemrograman Dasar",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              )),
                        )),
                        Container(
                          child: Text("3 sks",
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              )),
                        )
                      ],
                    ),
                    SizedBox(height: 5,),
                    Text("Nama Kelas : ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                        )),
                        SizedBox(height: 5,),
                    Text("Ruang Kelas : ",
                        style: TextStyle(
                          color: Colors.black, fontSize: 12,
                        )),
                        SizedBox(height: 5,),
                    Text("Waktu Perkuliahan : ",
                        style: TextStyle(
                          color: Colors.black, fontSize: 12,
                        )),
                        SizedBox(height: 5,),
                    Text("Dosen pengampu : ",
                        style: TextStyle(
                          color: Colors.black, fontSize: 12,
                        )),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
