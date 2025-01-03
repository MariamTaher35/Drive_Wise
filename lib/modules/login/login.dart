import 'package:drivewise/modules/Home_layout/home_layout.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../sign_up/ResisterView.dart';

class LoginView extends StatefulWidget {
  static const String routeName = "Login" ;

  LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailController = TextEditingController() ;

  TextEditingController passwordController = TextEditingController() ;
  var formKey = GlobalKey<FormState>();
  bool isVisable = false ;

  get isObscure => null;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
            backgroundColor: Colors.transparent,
            appBar:AppBar(
          backgroundColor: Colors.transparent,
          flexibleSpace: Image.asset("assets/images/car2.png",fit: BoxFit.cover,),
          toolbarHeight: 235,
        ),
            body: Container(
              decoration: BoxDecoration(borderRadius:
              BorderRadius.only(topLeft: Radius.circular(40),
                  topRight: Radius.circular(40)),
                border:Border.fromBorderSide(BorderSide(color: Colors.grey)),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Form(
                  key:formKey ,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 60,),
                          Padding(
                            padding: const EdgeInsets.only(right: 25),
                            child: TextFormField(
                              controller: emailController,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black),borderRadius: BorderRadius.circular(15)),
                                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey,),borderRadius:BorderRadius.circular(15) ),
                                fillColor:Color.fromRGBO(255, 255, 255, 0.75),
                                filled: true,
                                hintText: "email@gmail.com",
                                hintStyle: TextStyle(color: Colors.grey,),
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),),
                                prefixIcon: Icon(Icons.mail_outline,color: Colors.black,),
                              ),
                              validator:(value) {
                                if( value== null || value.trim().isEmpty)
                                {
                                  return "you must enter your email address";
                                }
                                var regex =  RegExp(
                                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
                                if(!regex.hasMatch(value)){
                                  return "Invalid email address";
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(height: 20,),
                          Padding(
                            padding: const EdgeInsets.only(right:25),
                            child: TextFormField(
                              controller:passwordController,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black),borderRadius: BorderRadius.circular(15)),
                                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey,),borderRadius:BorderRadius.circular(15) ),
                                fillColor:Color.fromRGBO(255, 255, 255, 0.75),
                                filled: true,
                                labelStyle: TextStyle(color: Colors.white),
                                hintText: "**************",
                                hintStyle: TextStyle(color: Colors.grey),
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),),
                                prefixIcon: Icon(Icons.lock_outline,color: Colors.black,),
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
                              validator: (value) {
                                if( value== null || value.trim().isEmpty)
                                {
                                  return "you must enter your password";
                                }
                                var regex =  RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                                if(!regex.hasMatch(value)){

                                  return "Invalid Password";
                                }
                                return null;

                              },
                              obscureText: isObscure== true
                                  ?isVisable
                                  :!isVisable,
                            ),
                          ),
                          SizedBox(height: 10,),
                          Row( mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 130),
                                child: MaterialButton(onPressed: (){
                                   Navigator.pushNamed(context,ForgotPassword.routeName);
                                },
                                  child: Text("Forget password ?", style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,
                                    color:Colors.white,),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              )
                            ],
                          ) ,
                          SizedBox(height: 30,),
                          Container(
                            child: Column
                              (children: [
                                   Container(
                                    decoration: BoxDecoration(
                                      //color: Color.fromRGBO(79, 172, 254, 1),
                                      borderRadius: BorderRadius.circular(8),

                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 30),
                                      child: MaterialButton(
                                        onPressed: () { login(); },
                                        child: Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                          color:Color(0xFF8E0C19),
                                        ),
                                        width: 216,
                                        height: 47,
                                        child: Text("Log In",
                                            style: TextStyle(
                                              fontSize: 22.0,
                                              color:Colors.white,
                                            )),
                                        ),
                                      ),
                                    ),
                                  ),
                              SizedBox(height: 30,),
                              Text("Don’t have account?",style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(255, 255, 255, 0.75),
                              ),),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context,RegisterView.routeName);
                                },
                                  child:
                              Text("Sing up",style: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 0.75),
                                  fontSize: 15),)),

                            ]),
                          )
                        ]),
                  ),
                ),
              ),
            ));
  }
  login() async {
    if (formKey.currentState!.validate()) {
      try {
        final credential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        Navigator.pushReplacementNamed(context, Homelayout.routeName);
        print("Homepage");
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        }
      }
    }
  }
}

