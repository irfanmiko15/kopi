import 'package:flutter/material.dart';
import 'package:kopi/constant.dart';

class Tanggal extends StatefulWidget {
  final String judul;
  const Tanggal(this.judul);

  @override
  _TanggalState createState() => _TanggalState();
}

class _TanggalState extends State<Tanggal> {
  // String judul;

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
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: ColorPalette.backgroundColor),
        child: ListView.builder(
            itemCount: 2,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext ctxt, int index) {
              if (widget.judul == "Tanggal") {
                return Padding(
                  padding: EdgeInsets.only(top: 20, left: 40, right: 40),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Alen BH | 20 Desember 2020 23:59',
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
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Padding(
                              padding: EdgeInsets.all(20),
                              child: Text(
                                'Bapak/Ibu kapan UTS mata kuliah apak/Ibu akan dilaksanakan?',
                                style: TextStyle(
                                    fontFamily: 'Gothic', fontSize: 16),
                                textAlign: TextAlign.left,
                              )),
                        )
                      ]),
                );
              }
              if (widget.judul == "Peraturan") {
                return Padding(
                  padding: EdgeInsets.only(top: 20, left: 40, right: 40),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Alen BH | 20 Desember 2020 23:59',
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
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Padding(
                              padding: EdgeInsets.all(20),
                              child: Text(
                                'Bapak/Ibu bagaimana teknis pelaksanaan UTS mata kuliah Bapak/Ibu?',
                                style: TextStyle(
                                    fontFamily: 'Gothic', fontSize: 16),
                                textAlign: TextAlign.left,
                              )),
                        )
                      ]),
                );
              }
              if (widget.judul == "Pengumpulan") {
                return Padding(
                  padding: EdgeInsets.only(top: 20, left: 40, right: 40),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Alen BH | 20 Desember 2020 23:59',
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
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Padding(
                              padding: EdgeInsets.all(20),
                              child: Text(
                                'Bapak/Ibu bagaimana teknis pengumpulan UTS mata kuliah Bapak/Ibu?',
                                style: TextStyle(
                                    fontFamily: 'Gothic', fontSize: 16),
                                textAlign: TextAlign.left,
                              )),
                        )
                      ]),
                );
              }
              if (widget.judul == "Pendampingan") {
                return Padding(
                  padding: EdgeInsets.only(top: 20, left: 40, right: 40),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Alen BH | 20 Desember 2020 23:59',
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
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Padding(
                              padding: EdgeInsets.all(20),
                              child: Text(
                                'Bapak/Ibu apakah saya boleh menerima pendampingan selamam engerjakan UTS mata kuliah Bapak/Ibu?',
                                style: TextStyle(
                                    fontFamily: 'Gothic', fontSize: 16),
                                textAlign: TextAlign.left,
                              )),
                        )
                      ]),
                );
              }
              if (widget.judul == "Nilai") {
                return Padding(
                  padding: EdgeInsets.only(top: 20, left: 40, right: 40),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Alen BH | 20 Desember 2020 23:59',
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
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Padding(
                              padding: EdgeInsets.all(20),
                              child: Text(
                                'Bapak/Ibu bagaimana teknis pelaksanaan UTS mata kuliah Bapak/Ibu?',
                                style: TextStyle(
                                    fontFamily: 'Gothic', fontSize: 16),
                                textAlign: TextAlign.left,
                              )),
                        )
                      ]),
                );
              }
              if (widget.judul == "Perbaikan Nilai") {
                return Padding(
                  padding: EdgeInsets.only(top: 20, left: 40, right: 40),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Alen BH | 20 Desember 2020 23:59',
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
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Padding(
                              padding: EdgeInsets.all(20),
                              child: Text(
                                'Bapak/Ibu bagaimana teknis pelaksanaan UTS mata kuliah Bapak/Ibu?',
                                style: TextStyle(
                                    fontFamily: 'Gothic', fontSize: 16),
                                textAlign: TextAlign.left,
                              )),
                        )
                      ]),
                );
              }
            }),
      ),
    );
  }
}
