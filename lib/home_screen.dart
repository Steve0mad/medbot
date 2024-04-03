import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    ScreenArgs args = ModalRoute.of(context)?.settings.arguments as ScreenArgs;
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Hello,\n ${args.userName}",
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
      body: Row(
        children: [
          Expanded(
            //after wrap Container with widget called Expanded
            child: Container(
                //here after learn how to use packege cheak what name of silder it is??0
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.all(50),
                color: Color(0xff3e6eca),
                child: Text(
                  "silder",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )),
          )
        ],
      ),
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
              label: 'Home'), //white
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
    );
  }
}
//class if Antuchaton dosent work

class ScreenArgs {
  String userName = '';
  var passWord = ""; //3k 5od balk
  ScreenArgs({required this.userName, required this.passWord});
}
