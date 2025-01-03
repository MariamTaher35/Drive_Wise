import 'dart:async';

import 'package:drivewise/modules/login/login.dart';
import 'package:drivewise/modules/sign_up/ResisterView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget{
  const SplashScreen({super.key});
  static const String routeName = "splash";
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context,LoginView.routeName);
    });
    return MaterialApp(
      home: Scaffold(
       backgroundColor: Colors.black,
        body:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                SizedBox(width: 20,),
                Text("Welcome to\n Drive wise",style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w400,
                    color: Colors.white
                ),),
              ],
            ),
            Image.asset("assets/images/car.png"),
          ],
        )
        ,)
    );
  }

}