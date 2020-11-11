import 'package:flutter/material.dart';
import 'package:kopi/constant.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Center(
      child: Column(
        children: [
          Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                "Masukan Email/Username dan Password untuk masuk ke Aplikasi",
                style: TextStyle(color: Colors.black, fontSize: 13),
                textAlign: TextAlign.center,
              ),
            ),
            TextField(
              style: TextStyle(fontSize: 14),
              cursorColor: ColorPalette.primaryDarkColor,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.grey,
                ),
                filled: true,
                fillColor: Colors.grey[100],
                hintText: "Email",
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorPalette.backgroundColor,
                    width: 0.0,
                  ),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorPalette.backgroundColor,
                    width: 0.0,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              obscureText: true,
              style: TextStyle(fontSize: 14),
              cursorColor: ColorPalette.primaryDarkColor,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.vpn_key,
                  color: Colors.grey,
                ),
                filled: true,
                fillColor: Colors.grey[100],
                hintText: "Password",
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorPalette.backgroundColor,
                    width: 0.0,
                  ),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorPalette.backgroundColor,
                    width: 0.0,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
            child:Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: ColorPalette.primaryDarkColor,
                borderRadius: BorderRadius.circular(5),
              ),
              padding: EdgeInsets.all(10),
              child:Text("Login",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
            ),
            onTap: (){
              // Navigator.push(context, MaterialPageRoute(builder: (context)=>OTP()));
            },
            ),
        ],
      ),
    )));
  }
}
