import 'package:flutter/material.dart';
import 'package:medbot/providers/auth_provider.dart';
import 'package:medbot/ui/HomeScreen/homeScreen.dart';
import 'package:medbot/ui/auth/login/LoginScreen.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName="/Splash";
   SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2),(){

     SplashFinish();


    });
    return Scaffold(
      backgroundColor: Color(0xfffd8901),
      body: Expanded(
        child: Center(
          child: Image.asset("assets/images/splash.png"),
        ),
      ),

    );

  }

  Future<void> SplashFinish() async {
    AuthUserProvider provider= Provider.of<AuthUserProvider>(context,listen: false);
    if(provider.isFirebaseLoggedin()){
     await provider.retrieveDatabaseUser();


      Navigator.pushReplacementNamed(context, HomeScreen.routeName);


    }else {
    Navigator.pushReplacementNamed(context, LoginScreen.routeName);
    }


  }
}
