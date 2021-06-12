import 'package:flutter/material.dart';
import 'package:megaflixz/screens/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Megaflixz',
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Color(0xffea4335))
        // primarySwatch: ,
      ),
      home: HomePage(),
    );
  }
}