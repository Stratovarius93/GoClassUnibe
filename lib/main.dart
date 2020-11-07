import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyApp',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to MyApp'),
        ),
        body: Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
