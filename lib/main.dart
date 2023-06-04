import 'package:flutter/material.dart';
import 'package:nbl/Player.dart';
import 'package:nbl/Statics.dart';
import 'package:nbl/games.dart';
import 'package:nbl/routes.dart';
import 'package:nbl/team.dart';
import 'Home.dart';
import 'Screen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        brightness: Brightness.dark,
        textTheme: Typography.whiteCupertino,
        primaryColor: Colors.white,
      ),
      routes: {
        "/" :(context)=>Splach_Screen(),
        Routes.Home:(context)=>HomeScreen(),
        Routes.Games:(context)=>Games(),
        Routes.Players:(context)=>Players(),
        Routes.Static:(context)=>Statics(),
        Routes.team:(context)=>Team(),
      },


    );
  }
}

