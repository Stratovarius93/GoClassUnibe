import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:GoClassUnibe/constants/Fonts.dart';

class MainTitle extends StatelessWidget {
  final Color colorText;
  final String Title;

  const MainTitle({
    Key key,
    this.colorText,
    this.Title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 8,
          ),
          Text(Title,
            style: TextStyle(
              fontFamily: fontApp,
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
              color: colorText,
            ),
          ),
        ],
      ),
    );
  }
}
