import 'dart:async';

import 'package:flutter/material.dart';

import 'Home.dart';
import 'routes.dart';
class Splach_Screen extends StatefulWidget {
  const Splach_Screen({Key? key}) : super(key: key);

  @override
  State<Splach_Screen> createState() => _Splach_ScreenState();
}

class _Splach_ScreenState extends State<Splach_Screen> {
  void Change()
  {
    Timer(
      Duration(seconds: 3),
        (){
          Navigator.pushNamed(context, Routes.Home);
          }
    );
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Change();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF0253a4),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('asserts/nba-logo.jpg'),
          CircularProgressIndicator(
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
