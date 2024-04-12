import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:medbot/ui/HomeScreen/chat/chat.dart';
import 'package:slide_to_act/slide_to_act.dart';

class HomeTab extends StatefulWidget {
  HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SlideAction(
                onSubmit: () {
                  Navigator.pushNamed(context, ChatTab.routeName);
                },
                innerColor: Colors.white,
                outerColor: Colors.blue,
                elevation: 3,
                borderRadius: 25,
                alignment: Alignment.centerRight,
              ),
            ],
          ),
        ));
  }
}