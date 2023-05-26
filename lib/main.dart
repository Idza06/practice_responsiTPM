import 'package:flutter/material.dart';
import 'homePage.dart';

//Qibran Idza Lafandzi - 123200141

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SuperHero App',
      theme: ThemeData(
        primaryColor: Colors.white,
        brightness: Brightness.dark,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}
