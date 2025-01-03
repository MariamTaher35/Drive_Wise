import 'dart:async';

import 'package:drivewise/modules/login/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';



class VerifyEmailScreen extends StatefulWidget{
  const VerifyEmailScreen({super.key});
  static const String routeName = "verify_email";

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  bool isEmailVerified = false;
  Timer? timer;


  @override
  void initState(){
    super.initState();
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    if(!isEmailVerified){
      sendVerificationEmail();
      timer = Timer.periodic(
        Duration(seconds: 3),
          (_)=> checkEmailVerified()
      );
    }
  }
  @override
  void dispose(){
    timer?.cancel();
    super.dispose();
  }
  Future checkEmailVerified() async{
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      isEmailVerified=FirebaseAuth.instance.currentUser!.emailVerified;
    });
    if(isEmailVerified) timer?.cancel();
  }
  Future sendVerificationEmail()async{
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();
       showDialog(context: context, builder: (context) {
        return AlertDialog(
          content: Text("the link is sent ! check your e-email"),
        );
      },
    }catch (e){
    print("error appear");
    }
  }
  @override
  Widget build(BuildContext context) => isEmailVerified
      ?LoginView()
      :Scaffold(
    backgroundColor: Colors.black,
    appBar: AppBar(
      backgroundColor: Colors.transparent,
      flexibleSpace: Image.asset("assets/images/car2.png",fit: BoxFit.cover,),
      toolbarHeight: 235,
    ),
    body: Container(
      width: double.infinity,
  decoration: BoxDecoration(borderRadius:
  BorderRadius.only(topLeft: Radius.circular(40),
  topRight: Radius.circular(40)),
  border:Border.fromBorderSide(BorderSide(color: Colors.grey)),
    ),
      child: Column(
        children: [
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Verify",style: TextStyle(
              color: Color(0xFF8E0C19),
              fontSize: 32,
              fontWeight: FontWeight.w400
            ),),
            Text("Email",style: TextStyle(
                color:Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.w400
            ),)
          ],),
          SizedBox(height: 60),
           Image.asset("assets/images/verify.png",width: 163,),
          SizedBox(height:150),
          MaterialButton(
            onPressed:sendVerificationEmail,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color:Color.fromRGBO(255, 255, 255, 0.75),
              ),
              width: 216,
              height: 47,
              child: Text("Resend",
                  style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.black,
                  )),
            ),
          ),
        ],
      ),
    )
  );

}

