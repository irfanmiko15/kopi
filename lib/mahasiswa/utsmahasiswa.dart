import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:kopi/constant.dart';
import 'package:kopi/dosen/tanggal.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

class UTSMahasiswa extends StatefulWidget {
  @override
  _UTSMahasiswaState createState() => _UTSMahasiswaState();
}

class _UTSMahasiswaState extends State<UTSMahasiswa> {
  AudioCache _audioCache;
  void modalNilai(context) {
    _audioCache.play('nilai.mp3');
    setState(() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Modal();
        },
      );
    });
  }

  void modalPendampingan(context) {
    _audioCache.play('Pendamping.mp3');
     setState(() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Modal();
        },
      );
    });
  }

  void modalPengumpulan(context){
    _audioCache.play('Pengumpulan.mp3');
   setState(() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Modal();
        },
      );
    });
  }
  void modalPengaturan(context){
    _audioCache.play('Peraturan.mp3');
    setState(() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Modal();
        },
      );
    });
  }
  void modalTanggal(context){
    _audioCache.play('Tanggal.mp3');
    setState(() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Modal();
        },
      );
    });
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
                                'assets/image/tanggalblue.png',
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
  @override
  _ModalState createState() => _ModalState();
}

class _ModalState extends State<Modal> {
  String dosen;
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
                    child: DropdownButton<String>(
                      icon: Container(
                        margin: EdgeInsets.only(left: deviceWidth * 0.45),
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
                      items: <String>['A', 'B', 'C', 'D']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (String newValue) {
                        setState(() {
                          dosen = newValue;
                        });
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
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                    },
                  ),
                ],
              ),
            )));
  }
}
