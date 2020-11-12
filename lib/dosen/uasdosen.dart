import 'package:flutter/material.dart';
import 'package:kopi/dosen/tanggal.dart';

class UasDosen extends StatefulWidget {
  @override
  _UasDosenState createState() => _UasDosenState();
}

class _UasDosenState extends State<UasDosen> {
    final List<UTS> uts = [
    UTS(
        id: 'DW1',
        title: 'Tanggal',
        gambar: 'assets/image/tanggalblue.png',
        widget: Tanggal('Tanggal')),
    UTS(
        id: 'DW2',
        title: 'Peraturan',
        gambar: 'assets/image/tanggalblue.png',
        widget: Tanggal('Peraturan')),
    UTS(
        id: 'DW3',
        title: 'Pengumpulan',
        gambar: 'assets/image/pengumpulanblue.png',
        widget: Tanggal('Pengumpulan')),
    UTS(
        id: 'DW4',
        title: 'Pendampingan',
        gambar: 'assets/image/pendampingblue.png',
        widget: Tanggal('Pendampingan')),
    UTS(
        id: 'DW5',
        title: 'Nilai',
        gambar: 'assets/image/nilaiblue.png',
        widget: Tanggal('Nilai')),
     UTS(
        id: 'DW6',
        title: 'Perbaikan Nilai',
        gambar: 'assets/image/perbaikannilai.png',
        widget: Tanggal('Perbaikan Nilai')),
  ];
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 60,
          backgroundColor: Color(0xFF4DA8E0),
          title: 
              Text('Ujian Tengah Semester',
                  style: TextStyle(fontFamily: 'Gothic')),
                  centerTitle: true,

        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(color: Color(0xFFB8DDFF)),
          child: ListView(children: <Widget>[
            Image.asset(
              'assets/image/telponbig.png',
              height: 200,
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, left: 25, right: 25),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height),
                child: GridView.builder(
                    addSemanticIndexes: true,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: uts.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 0.9, crossAxisCount: 2),
                    itemBuilder: (BuildContext ctxt, int index) {
                      return InkWell(
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
                                  uts[index].gambar.toString(),
                                  height: 80,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  uts[index].title.toString(),
                                  style: TextStyle(
                                      fontFamily: 'Gothic',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                )
                              ]),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (ctx) => uts[index].widget));
                        },
                      );
                    }),
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

  //BUAT CONSTRUCTOR DIMANA SECARA DEFAULT CLASS INI AKAN MEMINTA DATA TERSEBUT
  UTS({
    @required this.id,
    @required this.title,
    @required this.gambar,
    @required this.widget,
  });
}