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
      width: MediaQuery.of(context).size.width * 0.9,
      margin: EdgeInsets.only(top: 50.0, left: 30.0, right: 30.0),
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 6,
          ),
          Text(
            Title,
            style: TextStyle(
              fontFamily: fontApp,
              fontWeight: FontWeight.bold,
              fontSize: MediaQuery.of(context).size.width * 0.09,
              color: colorText,
            ),
          ),
        ],
      ),
    );
  }
}
