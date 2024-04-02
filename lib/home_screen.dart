import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class HomeScreen extends StatelessWidget {
  static const String routeName='home';
  @override
  Widget build(BuildContext context) {
   ScreenArgs args = ModalRoute.of(context)?.settings.arguments as ScreenArgs;
    return Scaffold(
      appBar: AppBar(
          title: Text("Hello,\n ${args.userName}",),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.notifications,     //must use badge Package
                color: Colors.white,
              ),
              onPressed: () {
                // do something
              },
            )
          ],
          backgroundColor: Colors.red),
      body: Row(
        children: [
          Expanded( //after wrap Container with widget called Expanded
            child: Container( //here after learn how to use packege cheak what name of silder it is??0
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.all(50),
                color: Color(0xff3e6eca),
                child: Text("silder",style: TextStyle(color: Colors.white,fontSize: 20),)),
          )
        ],
      ),
    );
  }

  }
//class if Antuchaton dosent work

class ScreenArgs{
  String userName='';
  var passWord=""; //3k 5od balk
  ScreenArgs({required this.userName,required this.passWord});
}

