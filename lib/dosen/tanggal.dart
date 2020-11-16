import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kopi/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:shimmer/shimmer.dart';

class Tanggal extends StatefulWidget {
  final String judul;
  const Tanggal(this.judul);

  @override
  _TanggalState createState() => _TanggalState();
}

Future<List<ListTanggal>> _getTanggal() async {
  await Future.delayed(Duration(seconds: 2));
  SharedPreferences localStorage = await SharedPreferences.getInstance();
  var id = localStorage.getString('id');

  var data = await http.post("http://45.13.132.46:3003/api/chat",
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "dosen_id": id,
      }));
  var jsonData = json.decode(data.body);
  List<ListTanggal> sliders = [];
  for (var u in jsonData['data']) {
    ListTanggal slider = ListTanggal(u["nama_dosen"], u["nama_mahasiswa"],
        u["pertanyaan"], u["id_pertanyaan"].toString());
    //print(u["image"]);
    sliders.add(slider);
  }
  // laporan = data['body'];
  print(sliders.length);
  return sliders;
}

class _TanggalState extends State<Tanggal> {
  // String judul;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getTanggal();
  }

  Widget tanggal(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: ColorPalette.backgroundColor,
        child: FutureBuilder(
            future: _getTanggal(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return ListView.builder(
                    itemCount: 3,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => Column(
                          children: [
                            Shimmer.fromColors(
                                baseColor: Colors.grey[300],
                                highlightColor: Colors.white,
                                child: Padding(
                                    padding: EdgeInsets.only(bottom: 10.0),
                                    child: Container(
                                      constraints:
                                          BoxConstraints(maxHeight: 20.0),
                                      margin: EdgeInsets.only(
                                          left: 30, right: 30, top: 20),
                                      decoration: BoxDecoration(
                                        color: Colors.grey[350],
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.8),
                                            spreadRadius: 0.1,
                                            blurRadius: 1,
                                            offset: Offset(0,
                                                0), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                    ))),
                            Shimmer.fromColors(
                                baseColor: Colors.grey[300],
                                highlightColor: Colors.white,
                                child: Padding(
                                    padding: EdgeInsets.only(bottom: 15.0),
                                    child: Container(
                                      constraints:
                                          BoxConstraints(maxHeight: 90.0),
                                      margin:
                                          EdgeInsets.only(left: 30, right: 30),
                                      decoration: BoxDecoration(
                                        color: Colors.grey[350],
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.8),
                                            spreadRadius: 0.1,
                                            blurRadius: 1,
                                            offset: Offset(0,
                                                0), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                    ))),
                          ],
                        ));
              } else {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext ctxt, int index) {
                      return Padding(
                        padding: EdgeInsets.only(top: 20, left: 40, right: 40),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                snapshot.data[index].namamahasiswa,
                                style: TextStyle(
                                    fontFamily: 'Gothic',
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                // height: MediaQuery.of(context).size.height * 0.18,
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
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Padding(
                                    padding: EdgeInsets.all(20),
                                    child: Text(
                                      'Bapak/ibu ${snapshot.data[index].namadosen}, ${snapshot.data[index].pertanyaan}?',
                                      style: TextStyle(
                                          fontFamily: 'Gothic', fontSize: 14),
                                      textAlign: TextAlign.left,
                                    )),
                              )
                            ]),
                      );
                    });
              }
            }));
  }

  Widget peraturan(BuildContext ctx) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: ColorPalette.backgroundColor,
      child: ListView.builder(
          itemCount: 2,
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext ctxt, int index) {
            return Padding(
              padding: EdgeInsets.only(top: 20, left: 40, right: 40),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Alen BH | 20 Desember 2020 23:50',
                      style: TextStyle(
                          fontFamily: 'Gothic',
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 15),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      // height: MediaQuery.of(context).size.height * 0.18,
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
                      child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Text(
                            'peraturan?',
                            style:
                                TextStyle(fontFamily: 'Gothic', fontSize: 16),
                            textAlign: TextAlign.left,
                          )),
                    )
                  ]),
            );
          }),
    );
  }

  Widget pengumpulan(BuildContext ctx) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: ColorPalette.backgroundColor,
      child: ListView.builder(
          itemCount: 2,
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext ctxt, int index) {
            return Padding(
              padding: EdgeInsets.only(top: 20, left: 40, right: 40),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Alen BH | 20 Desember 2020 23:50',
                      style: TextStyle(
                          fontFamily: 'Gothic',
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 15),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      // height: MediaQuery.of(context).size.height * 0.18,
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
                      child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Text(
                            'pengumpulan?',
                            style:
                                TextStyle(fontFamily: 'Gothic', fontSize: 16),
                            textAlign: TextAlign.left,
                          )),
                    )
                  ]),
            );
          }),
    );
  }

  Widget pendampingan(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: ColorPalette.backgroundColor,
      child: ListView.builder(
          itemCount: 2,
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext ctxt, int index) {
            return Padding(
              padding: EdgeInsets.only(top: 20, left: 40, right: 40),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Alen BH | 20 Desember 2020 23:50',
                      style: TextStyle(
                          fontFamily: 'Gothic',
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 15),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      // height: MediaQuery.of(context).size.height * 0.18,
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
                      child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Text(
                            'pendampingan',
                            style:
                                TextStyle(fontFamily: 'Gothic', fontSize: 16),
                            textAlign: TextAlign.left,
                          )),
                    )
                  ]),
            );
          }),
    );
  }

  Widget nilai(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: ColorPalette.backgroundColor,
      child: ListView.builder(
          itemCount: 2,
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext ctxt, int index) {
            return Padding(
              padding: EdgeInsets.only(top: 20, left: 40, right: 40),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Alen BH | 20 Desember 2020 23:50',
                      style: TextStyle(
                          fontFamily: 'Gothic',
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 15),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      // height: MediaQuery.of(context).size.height * 0.18,
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
                      child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Text(
                            'nilai?',
                            style:
                                TextStyle(fontFamily: 'Gothic', fontSize: 16),
                            textAlign: TextAlign.left,
                          )),
                    )
                  ]),
            );
          }),
    );
  }

  Widget perbaikannilai(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: ColorPalette.backgroundColor,
      child: ListView.builder(
          itemCount: 2,
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext ctxt, int index) {
            return Padding(
              padding: EdgeInsets.only(top: 20, left: 40, right: 40),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Alen BH | 20 Desember 2020 23:50',
                      style: TextStyle(
                          fontFamily: 'Gothic',
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 15),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      // height: MediaQuery.of(context).size.height * 0.18,
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
                      child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Text(
                            'perbaikan nilai?',
                            style:
                                TextStyle(fontFamily: 'Gothic', fontSize: 16),
                            textAlign: TextAlign.left,
                          )),
                    )
                  ]),
            );
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.judul,
              style:
                  TextStyle(fontFamily: 'Gothic', fontWeight: FontWeight.bold)),
          centerTitle: true,
          actions: <Widget>[
            InkWell(
                child: Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Image.asset(
                      'assets/image/homewhite.png',
                      width: 30,
                    )))
          ],
        ),
        body: widget.judul == 'Tanggal'
            ? tanggal(context)
            : widget.judul == 'Peraturan'
                ? peraturan(context)
                : widget.judul == 'Pengumpulan'
                    ? pengumpulan(context)
                    : widget.judul == 'Pendampingan'
                        ? pendampingan(context)
                        : widget.judul == 'Nilai'
                            ? nilai(context)
                            : perbaikannilai(context));
  }
}

class ListTanggal {
  final String namadosen;
  final String namamahasiswa;
  final String pertanyaan;
  final String id;

  ListTanggal(this.namadosen, this.namamahasiswa, this.pertanyaan, this.id);
}
