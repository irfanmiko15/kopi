import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kopi/constant.dart';
import 'package:kopi/dosen/homedosen.dart';
import 'package:kopi/mahasiswa/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Profil extends StatefulWidget {
  @override
  _ProfilState createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  TextEditingController passlama = TextEditingController();
  TextEditingController passbaru = TextEditingController();
  TextEditingController konfirmasipass = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  var username;
  var cek;
  bool _sound;
  bool _isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUsername();
  }

  getUsername() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    setState(() {
      cek = localStorage.getString('username');
      _sound = localStorage.getBool('sound');
    });

    print(cek);
  }

  loading() {
    // flutter defined function

    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
            content: Container(
                margin: EdgeInsets.all(10),
                child: Row(
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(width: 10),
                    Text("Loading...")
                  ],
                )));
      },
      barrierDismissible: false,
    );
  }

  _showDialog(data) async {
    // flutter defined function

    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          content: new Text("$data"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: ()  {
                Navigator.of(context).pop();
              }
            ),
          ],
        );
      },
    );
  }

  _showDialog2() async {
    // flutter defined function

    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          content: new Text("Ganti Pass berhasil"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () async {
                SharedPreferences localStorage =
                    await SharedPreferences.getInstance();

                if (localStorage.getString('role') == '1')
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (ctx) => HomeScreen()),
                      (route) => false);
                else
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (ctx) => HomeDosen()),
                      (route) => false);
              },
            ),
          ],
        );
      },
    );
  }

  update() async {
    setState(() {
      _isLoading = true;
    });
    print('cek');
    loading();
    await http
        .post("http://45.13.132.46:3003/api/user/update",
            headers: {"Content-Type": "application/json"},
            body: jsonEncode({
              'username': cek.toString(),
              'old_pass': passlama.text,
              'new_pass': passbaru.text,
              'confirm_new_pass': konfirmasipass.text
            }))
        .then((response) async {
           var data = jsonDecode(response.body);
      Navigator.of(context).pop();
     
      print(data.toString());
      if (data['error'].toString() == "false") {
        setState(() {
          _isLoading = false;
          _showDialog2();
        });
        
      } else {
        setState(() {
          _isLoading = false;
          _showDialog(data['msg']);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    username = cek;
    return Scaffold(
      appBar: AppBar(title: Text("Profil")),
      body: Container(
        margin: EdgeInsets.all(15),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              SizedBox(height: 10),
              Center(child: Text(cek, style: TextStyle(fontSize: 14))),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: passlama,
                decoration: InputDecoration(
                  hintText: 'Password Lama',
                  errorStyle: TextStyle(color: Colors.red),
                  errorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2.0),
                  ),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Password lama tidak boleh kosong';
                  }

                  return null;
                },
              ),
              SizedBox(height: 5),
              TextFormField(
                controller: passbaru,
                decoration: InputDecoration(
                  hintText: 'Password Baru',
                  errorStyle: TextStyle(color: Colors.red),
                  errorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2.0),
                  ),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return ' Password baru tidak boleh kosong';
                  }

                  return null;
                },
              ),
              SizedBox(height: 5),
              TextFormField(
                controller: konfirmasipass,
                decoration: InputDecoration(
                  hintText: 'Konfirmasi Password',
                  errorStyle: TextStyle(color: Colors.red),
                  errorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2.0),
                  ),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return ' Konfirmasi Password tidak boleh kosong';
                  }

                  return null;
                },
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorPalette.appbarColor),
                  child: Text(
                    "Simpan Perubahan",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
                onTap: () {
                  if (_formKey.currentState.validate()) {
                   
                    update();
                    print("kirim");
                  }
                },
              ),
              SizedBox(height: 15),
              Text("Pengaturan Suara"),
              SizedBox(
                height: 10,
              ),
              SwitchListTile(
                  title: const Text('On/Off'),
                  value: _sound,
                  onChanged: (bool value) async {
                    setState(() {
                      _sound = value;
                    });
                    SharedPreferences localStorage =
                        await SharedPreferences.getInstance();
                    localStorage.setBool('sound', _sound);
                    
                  },
                  secondary: const Icon(Icons.speaker_phone_rounded)),
            ],
          ),
        ),
      ),
    );
  }
}
