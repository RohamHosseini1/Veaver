import 'package:flutter/material.dart';
import 'package:hello_world/Homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VidFlow',
      home: HomePage(),
    );
  }
}
