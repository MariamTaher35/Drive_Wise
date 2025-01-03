import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/bmi_result/bmi_result.dart';
import 'package:flutter_application_1/modules/otp_screen/otp.dart';
import 'package:flutter_application_1/shared/component/component.dart';

class Adminstrator extends StatefulWidget {
  @override
  State<Adminstrator> createState() => _AdminstratorState();
}

class _AdminstratorState extends State<Adminstrator> {
  var email = TextEditingController();

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
                          height: 30.0,
                        ),
                        Text(
                          'Enter the user\'s email',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25.0,
                              fontWeight: FontWeight.w500),
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
                          height: 50.0,
                        ),
                        defaultButton(
                            background: Color.fromRGBO(142, 12, 25, 1),
                            text: 'Search',
                            function: () {
                              if (fokey.currentState!.validate()) {
                                print(email.text);
                                /*
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Otp()));
                                        */
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
}
