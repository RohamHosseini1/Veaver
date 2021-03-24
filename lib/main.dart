import 'package:flutter/material.dart';
import 'package:hello_world/Homepage.dart';
import 'package:hello_world/MockAuthRepository.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Veaver',
      theme: ThemeData(
        backgroundColor: Color.alphaBlend(Colors.grey, Colors.black),
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: HomePage(),
    );
  }
}
