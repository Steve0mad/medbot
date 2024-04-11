import 'package:flutter/material.dart';
import 'package:medbot/ui/HomeScreen/homeScreen.dart';
class LoginScreen extends StatelessWidget {
  static const String routeName='login';

   LoginScreen({super.key});
  String userName='';
  var passWord=""; //3k 5od balk

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          title: Text("Login"),
        ),
        body:Container(
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              TextField(
                onChanged: (newText){
                  userName = newText;
                },
                decoration: InputDecoration(labelText: "UserName") ,
              ),
              TextField(
                onChanged: (newText){
                 passWord = newText; //3k
                },

                decoration: InputDecoration(labelText: "Password") ,),
            ElevatedButton(onPressed: (){

             Navigator.pushNamed(context, HomeScreen.routeName,arguments: (userName: userName, passWord: passWord) );//to display the username

            }, child: Text('Login'))
              ],

              ),

        )
    ,
    );

  }

  }
