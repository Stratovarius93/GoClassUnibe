import 'package:GoClassUnibe/constants/Colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:GoClassUnibe/constants/Fonts.dart';

class CreateMiniText extends StatelessWidget {
  final String title;
  final String title2;
  final Color colorText;
  final TapGestureRecognizer tapGestureRecognizer;

  const CreateMiniText({
    Key key,
    this.title,
    this.colorText,
    this.title2,
    this.tapGestureRecognizer,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 40.0),
      child: Text.rich(
        TextSpan(
          text: title,
          style: TextStyle(
            fontFamily: fontApp,
            fontSize: MediaQuery.of(context).size.width * 0.04,
            color: colorText,
          ),
          children: [
            TextSpan(
                recognizer: tapGestureRecognizer,
                text: title2,
                style: TextStyle(
                  fontFamily: fontApp,
                  fontWeight: FontWeight.w800,
                  fontSize: MediaQuery.of(context).size.width * 0.04,
                  color: colorText,
                  //decoration: TextDecoration.underline,
                )),
          ],
        ),
      ),
    );
  }
}

class CreateMiniText2 extends StatelessWidget {
  final String title;
  final Color colorText;

  const CreateMiniText2({
    Key key,
    this.title,
    this.colorText,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      margin: EdgeInsets.only(left: 30.0, right: 30.0),
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 6,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: fontApp,
              fontWeight: FontWeight.w900,
              fontSize: 18,
              color: colorText,
            ),
          ),
        ],
      ),
    );
  }
}

class CreateMiniText3 extends StatelessWidget {
  final String title;

  const CreateMiniText3({
    Key key,
    this.title,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      margin: EdgeInsets.only(left: 30.0, right: 30.0),
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 6,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: fontApp,
              fontWeight: FontWeight.w900,
              fontSize: 14,
              color: colorAppBlue.withOpacity(0.6),
            ),
          ),
        ],
      ),
    );
  }
}
