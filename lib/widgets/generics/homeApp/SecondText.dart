import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:GoClassUnibe/constants/Fonts.dart';

class SecondMiniText extends StatelessWidget {
  final String Title;
  final Color colorText;

  const SecondMiniText({
    Key key,
    this.Title,
    this.colorText,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 30.0, left: 12.0, right: 12.0),
        child: Text(
          (Title),
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            color: colorText,
            fontFamily: fontApp,
            fontWeight: FontWeight.bold,
          ),
        ));
  }
}
