import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kopi/constant.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';

class JadwalSemesterIniScreen extends StatefulWidget {
  @override
  _JadwalSemesterIniScreenState createState() =>
      _JadwalSemesterIniScreenState();
}

Future<List<Jadwal>> _getJadwal() async {
  await Future.delayed(Duration(seconds: 2));
  SharedPreferences localStorage = await SharedPreferences.getInstance();
  var id = localStorage.getString('id');

  var data = await http.post("http://45.13.132.46:3003/api/jadwal",
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "mahasiswa_id": id,
      }));
  var jsonData = json.decode(data.body);
  List<Jadwal> sliders = [];
  for (var u in jsonData['data']) {
    Jadwal slider =
        Jadwal(u["hari"], u["jam"], u["nama_matkul"], u["id"].toString());
    //print(u["image"]);
    sliders.add(slider);
  }
  // laporan = data['body'];

  return sliders;
}

@override
class _JadwalSemesterIniScreenState extends State<JadwalSemesterIniScreen> {
  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getJadwal();
  }

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
        child: ListView(
          children: [
            Column(
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
                    child: FutureBuilder(
                        future: _getJadwal(),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.data == null) {
                            return ListView.builder(
                                itemCount: 3,
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) =>
                                    Shimmer.fromColors(
                                        baseColor: Colors.grey[300],
                                        highlightColor: Colors.white,
                                        child: Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 15.0),
                                            child: Container(
                                              constraints: BoxConstraints(
                                                  maxHeight: 90.0),
                                              margin: EdgeInsets.only(
                                                  left: 30, right: 30),
                                              decoration: BoxDecoration(
                                                color: Colors.grey[350],
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.8),
                                                    spreadRadius: 0.1,
                                                    blurRadius: 1,
                                                    offset: Offset(0,
                                                        0), // changes position of shadow
                                                  ),
                                                ],
                                              ),
                                            ))));
                          } else {
                            return ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: snapshot.data.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
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
                                        color:
                                            Color(0xFF1D6297).withOpacity(0.1),
                                        spreadRadius: 2,
                                        blurRadius: 4,
                                        offset: Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                                child: Container(
                                              child: Text(
                                                  snapshot
                                                      .data[index].nama_matkul
                                                      .toString(),
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
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                            "Nama Kelas : " +
                                                snapshot.data[index].nama_matkul
                                                    .toString(),
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                            )),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                            "Hari : " +
                                                snapshot.data[index].hari,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                            )),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                            "Waktu Perkuliahan : " +
                                                snapshot.data[index].jam
                                                    .toString(),
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                            )),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text("Dosen pengampu : ",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                            )),
                                      ]),
                                );
                              },
                            );
                          }
                        })),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Jadwal {
  final String hari;
  final String jam;
  final String nama_matkul;
  final String id;

  Jadwal(this.hari, this.jam, this.nama_matkul, this.id);
}
