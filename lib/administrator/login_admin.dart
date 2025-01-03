import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/administrator/admininstrator.dart';
import 'package:flutter_application_1/shared/component/component.dart';

class Login_Admin extends StatefulWidget {
  const Login_Admin({super.key});

  @override
  State<Login_Admin> createState() => _Login_AdminState();
}

class _Login_AdminState extends State<Login_Admin> {
  var email = TextEditingController();
  var password = TextEditingController();
  bool ispassword = true;

  var fokey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Form(
          key: fokey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                image: AssetImage('images/cardd.jpg'),
                height: 320,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Expanded(
                child: Container(
                  height: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(60.0),
                          topLeft: Radius.circular(60.0)),
                      border: Border.all(color: Colors.white60)),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20.0,
                        ),
                        SizedBox(
                          height: 60.0,
                        ),
                        defaultTextFormField(
                          hintText: "example@gmail.com",
                          controller: email,
                          inputType: TextInputType.emailAddress,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'Email is empty';
                            }
                            return null;
                          },
                          prefix: Icons.email,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'password is empty';
                            }
                            return null;
                          },
                          controller: password,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: ispassword,
                          decoration: InputDecoration(
                            filled: true,
                            hintText: 'Password',
                            fillColor: Colors.white70,
                            labelStyle: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.w400),
                            hintStyle: TextStyle(
                                color: Color.fromRGBO(134, 118, 118, 1)),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.black,
                            ),
                            suffixIcon: togglePassword(),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                          onFieldSubmitted: (String value) {
                            print(value);
                          },
                        ),
                        SizedBox(
                          height: 50.0,
                        ),
                        defaultButton(
                            background: Color.fromRGBO(142, 12, 25, 1),
                            text: 'Login',
                            function: () {
                              if (fokey.currentState!.validate()) {
                                print(email.text);

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Adminstrator()));
                              }
                            }),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget togglePassword() {
    return IconButton(
      onPressed: () {
        setState(() {
          ispassword = !ispassword;
        });
      },
      icon: ispassword ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
      color: Colors.black,
    );
  }
}
