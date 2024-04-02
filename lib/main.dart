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
      theme: ThemeData(
        bottomNavigationBarTheme:BottomNavigationBarThemeData(
          backgroundColor: Color(0xff3e6eca),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.black,
            selectedIconTheme: IconThemeData(color: Colors.white),
          unselectedIconTheme: IconThemeData(
            color: Colors.white,
                size: 32
          )
        ),

        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xff3e6eca),primary: Color(0xff3e6eca))
     ),
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