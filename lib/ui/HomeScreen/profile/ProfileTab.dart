

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:medbot/ui/auth/login/LoginScreen.dart';
import 'package:slide_to_act/slide_to_act.dart';

class ProfileTab extends StatefulWidget {
  static const String routeName = 'ProfileTab';
   ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(


      ),


      body: Container(
        child: Column(

            mainAxisAlignment: MainAxisAlignment.end,
            children: [
            SlideAction(
            onSubmit: () async {
              await FirebaseAuth.instance.signOut();
      Navigator.pushReplacementNamed(context, LoginScreen.routeName);
      },
        innerColor: Colors.white,

        outerColor: Colors.red,
        elevation: 3,
        borderRadius: 30,

              textStyle: TextStyle(fontSize: 25,color: Colors.white),
              text: "Sign out" ,
        alignment: Alignment.centerRight,
      ),
              Divider(
                // بفصل ما بيهم
                height: 50,
                thickness: 0,
                color: Colors.transparent,
              ),

    ])));
    }
}
