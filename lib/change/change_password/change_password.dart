import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../modules/Verify/test.dart';
import '../../modules/login/login.dart';

class ChangePassword extends StatefulWidget {
  static const String routeName = "ChangePassword" ;

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  var email = TextEditingController();
  var password = TextEditingController();
  var currentPass = TextEditingController();
  var newPass = TextEditingController();
  var displayName = TextEditingController();
  bool isVisable = false ;
  bool isObscure = false;
 // get isObscure => null;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/img_2.png"), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 92.0),
              child: Image(image: AssetImage("assets/images/profile.png"),width: 117),
            ),
            Image(image: AssetImage("assets/images/stars.png"),width: 117),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(FirebaseAuth.instance.currentUser!.displayName ??
                  'No Name',style: TextStyle(fontSize: 20,color:Colors.white ),),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                obscureText: true,
                controller: currentPass,
                decoration:
                InputDecoration( focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black),borderRadius: BorderRadius.circular(15)),
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey,),borderRadius:BorderRadius.circular(15) ),
                  filled: true,
                  fillColor:Colors.grey ,
                  label: Text("Current Password" ,style: TextStyle(color: Colors.black)),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),),
                  hintText: 'Current Password' , hintStyle: TextStyle(color: Colors.grey),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      isVisable = !isVisable;
                      setState(() {});
                    },
                    child: isVisable == true
                        ?Icon(Icons.visibility_off_outlined, color: Colors.black)
                        :Icon(Icons.visibility_outlined, color: Colors.black,
                    ),
                  ),
                ),
               /* obscureText: isObscure== true
                    ?isVisable
                    :!isVisable,*/
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                obscureText: true,
                controller: newPass,
                decoration:
                InputDecoration( focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black),borderRadius: BorderRadius.circular(15)),
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey,),borderRadius:BorderRadius.circular(15) ),
                  filled: true,
                  fillColor:Colors.grey ,
                  label: Text("New Password" ,style: TextStyle(color: Colors.black)),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),),
                   hintText: 'New Password' , hintStyle: TextStyle(color: Colors.grey),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      isVisable = !isVisable;
                      setState(() {});
                    },
                    child: isVisable == true
                        ?Icon(Icons.visibility_off_outlined, color: Colors.black)
                        :Icon(Icons.visibility_outlined, color: Colors.black,
                    ),
                  ),
                )
           /*   obscureText: isObscure== true
                    ?isVisable
                    :!isVisable,*/
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: ElevatedButton( style: ButtonStyle(backgroundColor:MaterialStateProperty.all(Color(0xff8E0C19)),
                  fixedSize: MaterialStatePropertyAll(Size(100, 30))
              ),
                  onPressed: () async {
                    if (displayName.value.text.isNotEmpty) {
                      try {
                        await FirebaseAuth.instance.currentUser!
                            .updateDisplayName(displayName.text);
                        if (!mounted) return;
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Test()));
                      } catch (e) {
                        if (kDebugMode) {
                          print(e);
                        }
                      }
                    }
                    if (currentPass.value.text.isNotEmpty &&
                        newPass.value.text.isNotEmpty) {
                      await FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                          email: FirebaseAuth
                              .instance.currentUser!.email!,
                          password: currentPass.text);
                      await FirebaseAuth.instance.currentUser!
                          .updatePassword(newPass.text);
                      if (!mounted) return;
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Update Success')));
                      Navigator.pushReplacementNamed(context, LoginView.routeName);
                    }

                  },
                  child: const Text('Change')),
            ),
          ],
        ),
      ),
    );
  }
}
