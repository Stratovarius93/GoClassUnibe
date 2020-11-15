import 'package:flutter/material.dart';
import 'package:GoClassUnibe/constants/Fonts.dart';
import 'package:GoClassUnibe/constants/Colors.dart';

class SingleTitle extends StatelessWidget {
  final String title;
  const SingleTitle({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          fontFamily: fontApp,
          fontWeight: FontWeight.w900,
          color: colorAppTextDark,
          fontSize: 35.0),
    );
  }
}
