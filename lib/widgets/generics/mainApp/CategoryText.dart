import 'package:flutter/material.dart';
//import 'package:GoClassUnibe/constants/Fonts.dart';
import 'package:GoClassUnibe/constants/Colors.dart';

class CategoryText extends StatelessWidget {
  final String title;
  const CategoryText({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      title.toUpperCase(),
      style: TextStyle(
          //fontFamily: fontApp,
          fontWeight: FontWeight.w800,
          color: colorAppTextLight,
          fontSize: 14),
    );
  }
}
