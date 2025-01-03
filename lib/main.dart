import 'package:drivewise/Verify/verify_email.dart';
import 'package:drivewise/modules/Home_layout/home_layout.dart';
import 'package:drivewise/modules/Like%20Splash/splash.dart';
import 'package:drivewise/modules/login/login.dart';
import 'package:drivewise/modules/sign_up/ResisterView.dart';
import 'package:drivewise/modules/forget_password/forget_password.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:drivewise/change/change_name/change_name.dart';
import 'package:drivewise/change/change_password/change_password.dart';
import 'package:drivewise/modules/Setting/setting.dart';
import 'modules/Verify/test.dart';
// Set the language codeawait FirebaseAuth.instance.setLanguageCode('en');

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,

  );
  runApp(const OurApplication());
}

class OurApplication extends StatelessWidget {
  const OurApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if(snapshot.hasData){
                return VerifyEmailScreen();
              } else{
                return LoginView();
              }
            },
        ),
      ),

      debugShowCheckedModeBanner: false,
    initialRoute: SplashScreen.routeName,
    routes: {
      LoginView.routeName:(context)=> LoginView(),
      RegisterView.routeName:(context)=> RegisterView(),
      Homelayout.routeName:(context)=> Homelayout(),
      SplashScreen.routeName:(context)=> SplashScreen(),
      VerifyEmailScreen.routeName:(context)=> VerifyEmailScreen(),
      ForgotPassword.routeName:(context)=>ForgotPassword(),
       Settings.routeName:(context)=>Settings(),
      Test.routeName:(context)=>Test(),
      ChangeName.routeName:(context)=>ChangeName(),
      ChangePassword.routeName:(context)=>ChangePassword(),

    },

    );
  }
}
