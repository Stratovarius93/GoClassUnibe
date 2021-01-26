import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:GoClassUnibe/constants/Fonts.dart';

class MainTitle extends StatelessWidget {
  final Color colorText;
  final String title;

  const MainTitle({
    Key key,
    this.colorText,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 6,
          ),
          Text(title,
            style: TextStyle(
              fontFamily: fontApp,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              color: colorText,
            ),
          ),
        ],
      ),
    );
  }
}
