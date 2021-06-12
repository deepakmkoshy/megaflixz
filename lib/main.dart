import 'package:flutter/material.dart';
import 'package:megaflixz/screens/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Megaflixz',
      theme: ThemeData(appBarTheme: AppBarTheme(color: Color(0xffe37400))
          // primarySwatch: ,
          ),
      home: HomePage(),
    );
  }
}
