import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:GoClassUnibe/widgets/screens/homeApp/FirstHome.dart';
import 'package:GoClassUnibe/widgets/screens/mainApp/SettingsScreen.dart';
import 'package:GoClassUnibe/widgets/screens/mainApp/IndexScreen.dart';
//import 'package:GoClassUnibe/constants/Colors.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, title: 'MyApp', home: IndexScreen());
  }
}
