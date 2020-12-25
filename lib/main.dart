import 'package:GoClassUnibe/widgets/screens/homeApp/FirstHome.dart';
import 'package:GoClassUnibe/widgets/screens/homeApp/HomeScreen.dart';
import 'package:GoClassUnibe/widgets/screens/homeApp/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:GoClassUnibe/widgets/screens/homeApp/FirstHome.dart';
import 'package:GoClassUnibe/widgets/screens/mainApp/IndexScreen.dart';
//import 'package:GoClassUnibe/constants/Colors.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent
      //statusBarBrightness: Brightness.dark
      ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
        //debugShowCheckedModeBanner: false, title: 'MyApp', home: HomeScreen());
        //theme: ThemeData(
        //appBarTheme: AppBarTheme(
        //brightness: Brightness.dark,
        //)),
        theme: ThemeData(splashColor: Colors.transparent),
        debugShowCheckedModeBanner: false,
        title: 'MyApp',
        home: IndexScreen());
  }
}
