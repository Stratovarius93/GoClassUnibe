import 'package:GoClassUnibe/constants/Shadows.dart';
import 'package:GoClassUnibe/constants/Fonts.dart';
import 'package:GoClassUnibe/constants/Title.dart';
import 'package:GoClassUnibe/widgets/generics/mainApp/CategoryText.dart';
import 'package:flutter/material.dart';
import 'package:GoClassUnibe/widgets/generics/mainApp/BigTitle.dart';

import 'package:GoClassUnibe/constants/Colors.dart';

class ScheduleScreen extends StatefulWidget {
  @override
  _ScheduleScreenState createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  final List<String> _dayList = [
    'Lunes',
    'Martes',
    'Miércoles',
    'Jueves',
    'Viernes'
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: colorAppBackground,
        body: ListView(children: [
          Container(
              padding: EdgeInsets.only(
                  top: titlePaddingTop(context),
                  left: 16,
                  right: 16,
                  bottom: 16),
              child: BigTitle(
                title: "Horario",
              )),
          Row(
            children: _dayList.map((val) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration:
                      BoxDecoration(boxShadow: <BoxShadow>[boxShadowApp]),
                  child: CircleAvatar(
                      radius: (MediaQuery.of(context).size.width * 0.15) / 2,
                      backgroundColor: Colors.white,
                      child: Text(
                        val[0],
                        style: TextStyle(
                            color: colorAppTextDark,
                            fontFamily: fontApp,
                            fontWeight: FontWeight.w800,
                            fontSize: 30),
                      )),
                ),
              );
            }).toList(),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CategoryText(
              title: "Lunes",
            ),
          )
        ]),
      ),
    );
  }
}
