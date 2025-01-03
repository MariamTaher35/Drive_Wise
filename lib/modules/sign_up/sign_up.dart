import 'package:drivewise/Verify/verify_email.dart';
import 'package:drivewise/modules/login/login.dart';
import 'package:drivewise/shared/components/companents.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatefulWidget{
  const RegisterView({super.key});
  static const String routeName = "sign_up";
  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {

  var formKey = GlobalKey<FormState>();

  bool isVisible = false;
  bool isObscure = false;

  TextEditingController emailController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  TextEditingController confirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home:Scaffold(
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
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Form(
                    key: formKey,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 25),
                      child: Column(children: [
                        SizedBox(height: 20,),
                        TextFormField(
                          controller: nameController,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black),borderRadius: BorderRadius.circular(15)),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey,),borderRadius:BorderRadius.circular(15) ),
                            filled: true,
                            fillColor:Color.fromRGBO(255, 255, 255, 0.75),
                            hintText: "Name",
                            hintStyle: TextStyle(
                              color: Color(0xFF867676)
                            ),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),),
                            prefixIcon: Icon(Icons.perm_identity,color: Colors.black,)
                          ),
                          validator: (value) {
                            if( value== null || value.trim().isEmpty)
                            {
                              return "you must enter your full name";
                            }
                            return null;

                          },
                        ),
                        SizedBox(height: 20,),
                        TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black),borderRadius: BorderRadius.circular(15)),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey,),borderRadius:BorderRadius.circular(15) ),
                              fillColor:Color.fromRGBO(255, 255, 255, 0.75),
                            filled: true,
                            hintText: "email@gmail.com",
                            hintStyle: TextStyle(
                                color: Color(0xFF867676)
                            ),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),),
                              prefixIcon: Icon(Icons.mail_outline,color: Colors.black,)
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
                        SizedBox(height: 20,),
                        TextFormField(
                          controller: phoneController,
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black),borderRadius: BorderRadius.circular(15)),
                              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey,),borderRadius:BorderRadius.circular(15) ),
                              fillColor:Color.fromRGBO(255, 255, 255, 0.75),
                              filled: true,
                              hintText: "phone number",
                              hintStyle: TextStyle(
                                  color: Color(0xFF867676)
                              ),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),),
                              prefixIcon: Icon(Icons.phone,color: Colors.black,)
                          ),
                          validator:(value) {
                            if( value== null || value.trim().isEmpty)
                            {
                              return "you must enter phone number";
                            }
                            var regex =  RegExp(
                                r'^(?:[+0]9)?0[0-9]{10}$'
                               );
                            if(!regex.hasMatch(value)){
                              return "Invalid phone number";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20,),
                        TextFormField(
                          controller:passwordController,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black),borderRadius: BorderRadius.circular(15)),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey,),borderRadius:BorderRadius.circular(15) ),
                            fillColor:Color.fromRGBO(255, 255, 255, 0.75),
                            filled: true,
                            hintText: "password",
                            hintStyle: TextStyle(color: Color(0xFF867676)),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),),
                              prefixIcon: Icon(Icons.lock_outline,color: Colors.black,),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                isVisible = !isVisible;
                                setState(() {});
                              },
                              child: isVisible == true
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
                              ?isVisible
                              :!isVisible,
                        ),
                        SizedBox(height: 20,),
                        TextFormField(
                          controller:confirmController,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black),borderRadius: BorderRadius.circular(15)),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey,),borderRadius:BorderRadius.circular(15) ),
                            fillColor:Color.fromRGBO(255, 255, 255, 0.75),
                            filled: true,
                            hintText: "confirm password",
                            hintStyle: TextStyle(color: Color(0xFF867676)),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),),
                            prefixIcon: Icon(Icons.lock_outline,color: Colors.black,),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                isVisible = !isVisible;
                                setState(() {});
                              },
                              child: isVisible == true
                                  ?Icon(Icons.visibility_off_outlined, color: Colors.black)
                                  :Icon(Icons.visibility_outlined, color: Colors.black,
                              ),
                            ),
                          ),
                          validator: (value) {
                            if( value== null || value.trim().isEmpty)
                            {
                              return "you must enter your confirmed password";
                            }
                            if(value != passwordController.text){
                              return "password doesn't match";
                            }
                            return null;
                          },
                          obscureText: isObscure== true
                              ?isVisible
                              :!isVisible,
                        ),
                        SizedBox(height: 20,),
                        MaterialButton(
                          onPressed: () async {
                            register();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Color(0xFF8E0C19),
                            ),
                            width: 216,
                            height: 47,
                            child: Text("Sign Up",
                                style: TextStyle(
                                  fontSize: 22.0,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                        SizedBox(height: 84,)
                      ]),
                    ),
                  ),


                ],
              ),
            ),
          ),
        )




        )
      );
  }

   Future register() async {
    if(formKey.currentState!.validate()){
      try{
        await  FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
        );
        Navigator.pushReplacementNamed(context,VerifyEmailScreen.routeName);
      }on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }

    }
  }
}






