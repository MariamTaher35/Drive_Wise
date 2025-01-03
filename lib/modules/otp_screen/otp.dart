import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/shared/component/component.dart';

class Otp extends StatefulWidget {
  const Otp({super.key});

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  var PIN1 = TextEditingController();
  var PIN2 = TextEditingController();
  var PIN3 = TextEditingController();
  var PIN4 = TextEditingController();
  var forkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Form(
          key: forkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 125, vertical: 100),
                child: Icon(
                  Icons.message_outlined,
                  size: 150.0,
                  color: Colors.white70,
                ),
              ),
              Expanded(
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
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
                        Text(
                          'Verification',
                          style: TextStyle(
                              color: Color.fromRGBO(142, 12, 25, 1),
                              fontSize: 35.0,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 50.0,
                        ),
                        Text(
                          'You will get OTP via SMS',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17.0,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              height: 68,
                              width: 64,
                              child: TextFormField(
                                controller: PIN1,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Empty';
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white70,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                style: Theme.of(context).textTheme.headline6,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 68,
                              width: 64,
                              child: TextFormField(
                                controller: PIN2,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Empty';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white70,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                                style: Theme.of(context).textTheme.headline6,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 68,
                              width: 64,
                              child: TextFormField(
                                controller: PIN3,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Empty';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white70,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                                style: Theme.of(context).textTheme.headline6,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 68,
                              width: 64,
                              child: TextFormField(
                                controller: PIN4,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Empty';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white70,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                                style: Theme.of(context).textTheme.headline6,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 51,
                        ),
                        defaultButton(
                            background: Colors.white,
                            text: 'Resend',
                            textcolor: Colors.black,
                            function: () {}),
                        SizedBox(
                          height: 30,
                        ),
                        defaultButton(
                            background: Color.fromRGBO(142, 12, 25, 1),
                            text: 'Verify',
                            function: () {
                              if (forkey.currentState!.validate()) {
                                print(PIN1.text);
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
