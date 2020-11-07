import 'package:flutter/material.dart';
import 'package:GoClassUnibe/constants/Fonts.dart';
import 'package:flutter/services.dart';
import 'package:GoClassUnibe/widgets/screens/homeApp/FirstHome.dart';
import 'package:GoClassUnibe/widgets/generics/homeApp/ButtonFirst.dart';
import 'package:GoClassUnibe/constants/Colors.dart';

void main(){
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.white,
          systemNavigationBarIconBrightness: Brightness.dark
      )
  );
  runApp(MyApp());

}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyApp',
      //home: FirstHome(),
      home: Scaffold(
          body: Center(
              child: FirstHome(),
          ),
      )
    );
  }
}
