import 'package:medbot/ui/HomeScreen/chat/chat.dart';
import 'package:medbot/ui/HomeScreen/history/historytab.dart';
import 'package:flutter/material.dart';
import 'package:medbot/ui/auth/login/LoginScreen.dart';
import 'package:medbot/ui/auth/register.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'ui/HomeScreen/homeScreen.dart';
import 'package:provider/provider.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( MyApp()); //wrap with provider widget ChangeNotifierProvider
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
      initialRoute:RegisterScreen.routeName,
      routes: {
               HomeScreen.routeName: (context) => HomeScreen () ,
               RegisterScreen.routeName:(context)=>RegisterScreen(),
               LoginScreen.routeName: (context) => LoginScreen () ,
               historyTab.routeName:(context)=> historyTab(),
               ChatTab.routeName:(context)=>ChatTab()

      },
    );
  }
}