import 'package:flutter/material.dart';
import 'package:kopi/mahasiswa/uasmahasiswa.dart';
import 'package:kopi/mahasiswa/utsmahasiswa.dart';

class KomunikasiScreen extends StatefulWidget {
  @override
  _KomunikasiScreenState createState() => _KomunikasiScreenState();
}

class _KomunikasiScreenState extends State<KomunikasiScreen> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 60,
        backgroundColor: Color(0xFF4DA8E0),
        title:  Text('Komunikasi', style: TextStyle(fontFamily: 'Gothic')),
        centerTitle: true,
            actions: [
              Container(child:Image.asset("assets/image/homewhite1.png")),
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
                  padding: EdgeInsets.only( right: 25, left: 25),
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
                      children:<Widget> [
                      Expanded(
                        flex: 1,
                        child: Image.asset('assets/image/utsblue.png',
                          height: 70,
                      )),
                      Expanded(
                        flex: 2,
                        child: Text("Ujian Tengah Semester",
                        style: TextStyle(fontFamily: 'Gothic', fontWeight: FontWeight.bold),
                        ))
                    ],),
                  )),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (ctx)=>UTSMahasiswa()));
                  },
                  ),
                   InkWell(
                                        child: Padding(
                  padding: EdgeInsets.only(top:25, right: 25, left: 25),
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
                        children:<Widget> [
                        Expanded(
                          flex: 1,
                          child: Image.asset('assets/image/uasblue.png',
                            height: 70,
                        )),
                        Expanded(
                          flex: 2,
                          child: Text("Ujian Akhir Semester",
                          style: TextStyle(fontFamily: 'Gothic', fontWeight: FontWeight.bold),
                          ))
                      ],),
                  )),
                  onTap:(){
                    Navigator.push(context, MaterialPageRoute(builder: (ctx)=>UASMahasiswa()));
                  }
                   )

            ]),
      ),
    );
  }
}