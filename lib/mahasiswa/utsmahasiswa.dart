import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:kopi/constant.dart';
import 'package:kopi/dosen/detailuts.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class UTSMahasiswa extends StatefulWidget {
  @override
  _UTSMahasiswaState createState() => _UTSMahasiswaState();
}

class _UTSMahasiswaState extends State<UTSMahasiswa> {
  AudioCache _audioCache;
  void modalNilai(context) async {
    SharedPreferences localPrefrence = await SharedPreferences.getInstance();
    bool getSound = localPrefrence.getBool('sound');
    if (getSound == true) {
      _audioCache.play('nilai.mp3');
      setState(() {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Modal('7', 'Nilai', 'Bapak/Ibu Nilai UTS Saya Berapa ya?');
          },
        );
      });
    } else {
      setState(() {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Modal('7', 'Nilai', 'Bapak/Ibu Nilai UTS Saya Berapa ya?');
          },
        );
      });
    }
  }

  void modalPendampingan(context) async {
    SharedPreferences localPrefrence = await SharedPreferences.getInstance();
    bool getSound = localPrefrence.getBool('sound');
    if (getSound == true) {
      _audioCache.play('Pendamping.mp3');
      setState(() {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Modal('6', 'Pendamping',
                'Bapak/Ibu apakah saya boleh menerima pendampingan selama mengerjakan UTS mata kuliah Bapak/Ibu?');
          },
        );
      });
    } else {
      setState(() {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Modal('6', 'Pendamping',
                'Bapak/Ibu apakah saya boleh menerima pendampingan selama mengerjakan UTS mata kuliah Bapak/Ibu?');
          },
        );
      });
    }
  }

  void modalPengumpulan(context) async {
    SharedPreferences localPrefrence = await SharedPreferences.getInstance();
    bool getSound = localPrefrence.getBool('sound');
    if (getSound == true) {
      _audioCache.play('Pengumpulan.mp3');
      setState(() {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Modal('5', 'Pengumpulan',
                'Bapak/Ibu bagaimana teknis pengumpulan UTS mata kuliah Bapak/Ibu?');
          },
        );
      });
    } else {
      setState(() {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Modal('5', 'Pengumpulan',
                'Bapak/Ibu bagaimana teknis pengumpulan UTS mata kuliah Bapak/Ibu?');
          },
        );
      });
    }
  }

  void modalPengaturan(context) async {
    SharedPreferences localPrefrence = await SharedPreferences.getInstance();
    bool getSound = localPrefrence.getBool('sound');
    if (getSound == true) {
      _audioCache.play('Peraturan.mp3');
      setState(() {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Modal('4', 'Peraturan',
                'Bapak/Ibu bagaimana teknis pelaksanaan UTS mata kuliah Bapak/Ibu?');
          },
        );
      });
    } else {
      setState(() {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Modal('4', 'Peraturan',
                'Bapak/Ibu bagaimana teknis pelaksanaan UTS mata kuliah Bapak/Ibu?');
          },
        );
      });
    }
  }

  void modalTanggal(context) async {
    SharedPreferences localPrefrence = await SharedPreferences.getInstance();
    bool getSound = localPrefrence.getBool('sound');
    if (getSound == true) {
      _audioCache.play('Tanggal.mp3');
      setState(() {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Modal('3', 'Tanggal',
                'Bapak/Ibu kapan UTS mata kuliah Bapak/Ibu akan dilaksanakan?');
          },
        );
      });
    } else {
      setState(() {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Modal('3', 'Tanggal',
                'Bapak/Ibu kapan UTS mata kuliah Bapak/Ibu akan dilaksanakan?');
          },
        );
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _audioCache = AudioCache(
        prefix: "audio/",
        fixedPlayer: AudioPlayer()..setReleaseMode(ReleaseMode.STOP));
  }

  @override
  Widget build(BuildContext context) {
    String dosen;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 60,
          backgroundColor: Color(0xFF4DA8E0),
          title: Text('Ujian Tengah Semester',
              style: TextStyle(fontFamily: 'Gothic')),
          centerTitle: true,
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(color: Color(0xFFB8DDFF)),
          child: ListView(children: <Widget>[
            Image.asset(
              'assets/image/bertanya.png',
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
                                'assets/image/tanggalblue.png',
                                height: 80,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Tanggal",
                                style: TextStyle(
                                    fontFamily: 'Gothic',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              )
                            ]),
                      ),
                      onTap: () {
                        modalTanggal(context);
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
                                'assets/image/peraturanblue.png',
                                height: 80,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Peraturan",
                                style: TextStyle(
                                    fontFamily: 'Gothic',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              )
                            ]),
                      ),
                      onTap: () {
                        modalPengaturan(context);
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
                                'assets/image/pengumpulanblue.png',
                                height: 80,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Pengumpulan",
                                style: TextStyle(
                                    fontFamily: 'Gothic',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              )
                            ]),
                      ),
                      onTap: () {
                        modalPengumpulan(context);
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
                                "Pendampingan",
                                style: TextStyle(
                                    fontFamily: 'Gothic',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              )
                            ]),
                      ),
                      onTap: () {
                        modalPendampingan(context);
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
                                'assets/image/nilaiblue.png',
                                height: 80,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Nilai",
                                style: TextStyle(
                                    fontFamily: 'Gothic',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              )
                            ]),
                      ),
                      onTap: () {
                        modalNilai(context);
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

class UTS {
  final String id;
  final String title;
  final String gambar;
  final Widget widget;

  UTS({
    @required this.id,
    @required this.title,
    @required this.gambar,
    @required this.widget,
  });
}

class Modal extends StatefulWidget {
  final String pertanyaan_id;
  final String titel;
  final String body;
  Modal(this.pertanyaan_id, this.titel, this.body);
  @override
  _ModalState createState() => _ModalState();
}

class _ModalState extends State<Modal> {
  bool _isLoading = false;
  String dosen;
  String id = '';
  List getdosen = List();
  _getDosen() async {
    await http
        .get(
      "http://45.13.132.46:3003/api/dosen",
    )
        .then((response) async {
      var data = jsonDecode(response.body);
      setState(() {
        getdosen = data['data'];
        print(data.toString());
      });
    });
  }

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Pesanan Berhasil Terkirim"),
          content: new Text("Ke dosen"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  chat() async {
    setState(() {
      _isLoading = true;
    });
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    id = sharedPreferences.getString('id') ?? '';

    print("muncul : $id");

    await http
        .post("http://45.13.132.46:3003/api/chat/insert",
            headers: {"Content-Type": "application/json"},
            body: jsonEncode({
              'pertanyaan_id': widget.pertanyaan_id.toString(),
              'mahasiswa_id': id,
              'dosen_id': dosen
            }))
        .then((response) async {
      var data = jsonDecode(response.body);
      print(data.toString());
      if (data['error'].toString() == "false") {
        await http.post("http://45.13.132.46:3003/api/fcm/send",
            headers: {"Content-Type": "application/json"},
            body: jsonEncode({
              'dosen_id': dosen,
              'title': widget.titel.toString(),
              'message': widget.body.toString()
            }));
        _showDialog();
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getDosen();
  }

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();
  //   _getDosen().dispose();
  // }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Container(
        child: Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            elevation: 16,
            child: Container(
              width: deviceWidth,
              height: 200,
              child: Column(
                children: [
                  InkWell(
                      child: Container(
                          margin: EdgeInsets.all(5),
                          alignment: Alignment.topRight,
                          child: Icon(Icons.close, color: Colors.red)),
                      onTap: () {
                        Navigator.pop(context);
                      }),
                  Text(
                    "Pilih Nama Dosen",
                    style: TextStyle(fontSize: 16),
                  ),
                  Container(
                    height: 30,
                    width: deviceWidth,
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                    decoration: BoxDecoration(
                      color: ColorPalette.backgroundColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: DropdownButton(
                      isExpanded: true,
                      icon: Container(
                        child: Icon(Icons.keyboard_arrow_down),
                      ),
                      hint: Text(
                        'Pilih Dosen',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      iconSize: 24,
                      elevation: 16,
                      underline: Container(
                        height: 0,
                      ),
                      items: getdosen.map((item) {
                        return DropdownMenuItem(
                          child: Text(
                            item['nama'],
                            style: TextStyle(fontSize: 12),
                          ),
                          value: item['id'].toString(),
                        );
                      }).toList(),
                      onChanged: (value) {
                        if (this.mounted) {
                          setState(() {
                            dosen = value;
                            print(dosen);
                          });
                        }
                      },
                      value: dosen,
                    ),
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    child: Container(
                      margin: EdgeInsets.only(left: 100, right: 100),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: ColorPalette.primaryDarkColor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: EdgeInsets.all(15),
                      child: Text(
                        "Pilih",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    onTap: () {
                      chat();
                    },
                  ),
                ],
              ),
            )));
  }
}
