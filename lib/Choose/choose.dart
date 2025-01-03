import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/administrator/login_admin.dart';
import 'package:flutter_application_1/shared/component/component.dart';

class Choose extends StatefulWidget {
  const Choose({super.key});

  @override
  State<Choose> createState() => _ChooseState();
}

class _ChooseState extends State<Choose> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('images/cardd.jpg'),
              height: 320,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            defaultButton(
                background: Color.fromRGBO(142, 12, 25, 1),
                text: 'User',
                function: () {
                  /*
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => User_Data()));
                              */
                }),
            SizedBox(
              height: 25,
            ),
            defaultButton(
                textcolor: Colors.black,
                background: Colors.white,
                text: 'Admin',
                function: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Login_Admin()));
                }),
          ],
        ),
      ),
    );
  }
}
