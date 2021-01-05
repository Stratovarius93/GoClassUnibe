import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:GoClassUnibe/constants/Fonts.dart';

class CreateLoginButton extends StatelessWidget {
  final String Title;
  final Icon icon;
  final Color color;
  final Color colorText;

  const CreateLoginButton({
    Key key,
    this.Title,
    this.icon,
    this.color,
    this.colorText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width * 0.20,
      width: MediaQuery.of(context).size.width * 0.90,
      padding: const EdgeInsets.only(top: 20.0, left: 15.0, right: 15.0),
      child: RaisedButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              (Title),
              style: TextStyle(
                fontSize: 17.0,
                fontFamily: fontApp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(
              Icons.arrow_forward,
              size: 20.0,
            ),
          ],
        ),
        color: color,
        textColor: colorText,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ), onPressed: () {  },
      ),
    );
  }
}
