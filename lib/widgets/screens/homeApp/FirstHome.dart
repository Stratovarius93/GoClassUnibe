import 'package:flutter/material.dart';

class FirstHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     title: "First home", 
     home: Scaffold(
         body: Center(
             child: Text("First home"),
         ),
     ),
    );
  }
}
