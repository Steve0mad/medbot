import 'package:medbot/LoginScreen.dart';
import 'package:medbot/history_screen.dart';
import 'home_screen.dart';
import 'package:flutter/material.dart';
void main() {
  runApp( MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData(brightness: Brightness.dark,),
      debugShowCheckedModeBanner: false,
      // remove the small badge that top right the screen
      initialRoute:LoginScreen.routeName,
      routes: {
               HomeScreen.routeName: (context) => HomeScreen () ,
               LoginScreen.routeName: (context) => LoginScreen () ,
               history_screen.routeName:(context)=> history_screen ()
      },
    );
  }
}