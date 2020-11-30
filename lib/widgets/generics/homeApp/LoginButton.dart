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
      padding: const EdgeInsets.only(top:10.0,left: 40.0,right: 40.0,bottom: 20.0),
      height: 80.0,
      width: MediaQuery.of(context).size.width * 0.80,
      child: RaisedButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text((Title),style: TextStyle(fontSize: 17.0, fontFamily: fontApp, fontWeight: FontWeight.bold,),),
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


