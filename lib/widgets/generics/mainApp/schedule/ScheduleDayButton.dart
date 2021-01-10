import 'package:GoClassUnibe/constants/Fonts.dart';
import 'package:GoClassUnibe/constants/Shadows.dart';
import 'package:flutter/material.dart';

class ScheduleDayButton extends StatelessWidget {
  final String day;
  final Color colorCircle;
  final Color colorText;

  const ScheduleDayButton({Key key, @required this.day, this.colorCircle, this.colorText})
      : super(key: key);
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16),
      //padding: EdgeInsets.all(10),
      child: Container(
          decoration: BoxDecoration(boxShadow: <BoxShadow>[boxShadowApp]),
          child: CircleAvatar(
            radius: (MediaQuery.of(context).size.width * 0.17) / 2,
            backgroundColor: colorCircle,
            child: Text(
              day[0].toUpperCase(),
              style: TextStyle(
                  color: colorText,
                  fontFamily: fontApp,
                  fontWeight: FontWeight.w800,
                  fontSize: 30),
            ),
          )),
    );
  }
}
