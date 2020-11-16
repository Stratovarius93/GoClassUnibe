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
      padding: const EdgeInsets.only(top: 50.0, right: 50.0, left: 50.0),
      height: 90.0,
      child: RaisedButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text((Title),style: TextStyle(fontSize: 20.0, fontFamily: fontApp, fontWeight: FontWeight.bold,),),
            Icon( Icons.arrow_forward, size: 20.0,
            ),
          ],

        ),
        color: color,
        textColor: colorText,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),

        onPressed: () {},
      ),
    );
  }

}


