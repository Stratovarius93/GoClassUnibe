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
        padding: EdgeInsets.only(top: 32),
        child:  Text((Title),
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 25.0,color: colorText,fontFamily: fontApp),
        ));}
}