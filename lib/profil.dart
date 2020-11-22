import 'package:flutter/material.dart';
import 'package:kopi/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profil extends StatefulWidget {
  @override
  _ProfilState createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  TextEditingController passlama = TextEditingController();
  TextEditingController passbaru = TextEditingController();
  TextEditingController konfirmasipass = TextEditingController();

  var username;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUsername();
  }

  getUsername() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    username = localStorage.getString('nim');
    print(username);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profil")),
      body: Container(
        margin: EdgeInsets.all(15),
        child: ListView(
          children: [
            SizedBox(height:10),
            Center(child:Text("$username",style:TextStyle(fontSize:14))),
          
            SizedBox(height: 10,),
            TextField(
              controller: passlama,
              decoration: InputDecoration(hintText: 'Password Lama'),
            ),
            SizedBox(height: 5),
            TextField(
              controller: passbaru,
              decoration: InputDecoration(hintText: 'Password Baru'),
            ),
             SizedBox(height: 5),
            TextField(
              controller: konfirmasipass,
              decoration: InputDecoration(hintText: 'Konfirmasi Password'),
            ),
            SizedBox(height: 10,),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: ColorPalette.appbarColor),
            child: Text("Simpan Perubahan",style: TextStyle(color: Colors.white,fontSize: 14,),),)
          ],
        ),
      ),
    );
  }
}
