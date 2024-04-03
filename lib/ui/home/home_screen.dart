import 'package:flutter/material.dart';
import 'package:medbot/ui/history/historytab.dart';
import 'package:medbot/ui/profile/ProfileTab.dart';

import '../chat/chat.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Hello,\n Mariam",
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.notifications, //must use badge Package
                color: Colors.black,
              ),
              onPressed: () {
                // do something
              },
            )
          ],
          backgroundColor: Colors.transparent),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedTabIndex,
        onTap: (index){

          setState(() {
            selectedTabIndex= index;
          });
        },
        items: [
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Image(
                  image: AssetImage('assets/images/icons8-keypad-24.png')),
              label: 'home'), //white
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Image(
                  image: AssetImage('assets/images/icons8-chat-24 (1).png')),
              label: 'Chat'), //black
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon:
                  Image(image: AssetImage('assets/images/icons8-timer-24.png')),
              label: 'History'), //black
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Image(
                  image: AssetImage('assets/images/icons8-person-24.png')),
              label: 'Profile'), //black
        ],
      ),
      body: tabs[selectedTabIndex],
    );

  }
 var tabs=[



   HomeScreen(),
   ChatTab(),
   historyTab(),
   ProfileTab()


 ];







}
