import 'package:flutter/material.dart';
import 'package:layout_01/screens/home_screen3_11.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: HomeScreen(),
      ),
    );
  }
}
