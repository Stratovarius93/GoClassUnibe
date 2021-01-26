import 'package:GoClassUnibe/constants/Colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:GoClassUnibe/constants/Fonts.dart';

class CreateLoginButton extends StatelessWidget {
  final String Title;
  final Icon icon;
  final Color color;
  final Color colorText;
  final VoidCallback onTap;

  const CreateLoginButton({
    Key key,
    this.Title,
    this.icon,
    this.color,
    this.colorText,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65.0,
      child: RaisedButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              (Title),
              style: TextStyle(
                fontSize: 20.0,
                fontFamily: fontApp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 16,),
            Icon(
              Icons.arrow_forward,
              size: 20.0,
            ),
          ],
        ),
        color: color,
        disabledColor: Colors.blueGrey.shade100,
        textColor: colorText,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        onPressed: onTap,
      ),
    );
  }
}
