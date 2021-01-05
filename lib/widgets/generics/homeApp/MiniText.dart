import 'package:GoClassUnibe/constants/Colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:GoClassUnibe/constants/Fonts.dart';

class CreateMiniText extends StatelessWidget {
  final String Title;
  final Color colorText;

  const CreateMiniText({
    Key key,
    this.Title,
    this.colorText,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 40.0),
      child: Text.rich(
        TextSpan(
          text: '¿Olvidaste tu contraseña?',
          style: TextStyle(
            fontFamily: fontApp,
            fontWeight: FontWeight.bold,
            fontSize: MediaQuery.of(context).size.width * 0.05,
            color: colorText,
          ),
          children: <TextSpan>[
            TextSpan(
                text: 'Restaura aquí',
                style: TextStyle(
                  fontFamily: fontApp,
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.width * 0.05,
                  color: colorText,
                  decoration: TextDecoration.underline,
                )),
            // can add more TextSpans here...
          ],
        ),
      ),
    );
  }
}

class CreateMiniText2 extends StatelessWidget {
  final String Title;
  final Color colorText;

  const CreateMiniText2({
    Key key,
    this.Title,
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
            Title,
            style: TextStyle(
              fontFamily: fontApp,
              fontWeight: FontWeight.bold,
              fontSize: MediaQuery.of(context).size.width * 0.06,
              color: Color.fromRGBO(151, 156, 156, 61),
            ),
          ),
        ],
      ),
    );
  }
}
