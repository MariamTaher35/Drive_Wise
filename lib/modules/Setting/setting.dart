import 'package:drivewise/modules/Verify/test.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../login/login.dart';

class Settings extends StatefulWidget {
  static const String routeName = "Settings" ;
  Settings({super.key});


  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return  Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/img_2.png"), fit: BoxFit.cover)),
      child:  Scaffold(
        backgroundColor: Colors.transparent,

        body: Column(
          
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 92.0),
              child: Image(image: AssetImage("assets/images/profile.png"),width: 117),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Image(image: AssetImage("assets/images/stars.png"),width: 117),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                FirebaseAuth.instance.currentUser!.displayName ??
                    'No Name',style: TextStyle(fontSize: 20,color:Colors.white ),),
            ),
            MaterialButton(
              onPressed: () {Navigator.pushNamed(context,Test.routeName);},
              child: Padding(
                padding: const EdgeInsets.only(top: 17.0,bottom: 100),
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color:Color(0xFF8E0C19),
                  ),
                  width: 157,
                  height: 47,
                  child: Text("Edit Profile",
                      style: TextStyle(
                        fontSize: 17.0,
                        color:Colors.white,
                      )),
                ),
              ),
            ),

        /*    Row(
              children: [
                Icon(Icons.settings)
                , SizedBox(width: 20,)
                , Text("privacy")
                , SizedBox(width: 150,)

                ,  InkWell(onTap: () {
                  Navigator.pushNamed(context, Test.routeName);
                },
                    child: Icon(Icons.arrow_forward))


              ],
            ),*/
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:13.0),
                  child: Icon(Icons.announcement_outlined,color: Color(0xFF8E0C19),size: 35,),
                )
                , Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("About DriveWise",style: TextStyle(color: Colors.white,fontSize: 18),),
                )
              ],
            ),
             Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left:13.0),
                  child: Icon(Icons.logout,color: Color(0xFF8E0C19), size: 35, ),
                )
                , Padding(
                  padding: EdgeInsets.all(8.0),
                  child:TextButton(
                      style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.transparent)),
                      onPressed: () async {
                        Navigator.pushReplacementNamed(context,LoginView.routeName);
                      },
                      child:Text("LogOut",style: TextStyle(color: Colors.white,fontSize: 18),),),
                )
              ],
            ),

          ],
        ),

      ),



    );
  }
}
