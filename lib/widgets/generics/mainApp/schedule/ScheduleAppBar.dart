import 'package:GoClassUnibe/constants/Colors.dart';
import 'package:GoClassUnibe/constants/Fonts.dart';
import 'package:GoClassUnibe/widgets/screens/mainApp/Schedule2Screen.dart';
import 'package:flutter/material.dart';

AppBar scheduleAppBar() {
  return AppBar(
    actions: [
      InkWell(
        onTap: () {
          print("Hola mundo");
        },
        child: Padding(
          padding: const EdgeInsets.only(right: 8),
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            child: Icon(
              Icons.more_vert,
              color: colorAppBlue,
            ),
          ),
        ),
      )
    ],
    centerTitle: true,
    elevation: 0,
    backgroundColor: colorAppBackground,
    title: Text('Horario',
        style: TextStyle(
            color: colorAppTextDark,
            fontFamily: fontApp,
            fontSize: 28,
            fontWeight: FontWeight.bold)),
  );
}
