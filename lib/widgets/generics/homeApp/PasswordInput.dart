import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:GoClassUnibe/constants/Fonts.dart';

class CreatePasswordInput extends StatelessWidget {
  final String Title;
  final Icon icon;
  final Color color;
  final Color colorText;

  const CreatePasswordInput({
    Key key,
    this.Title,
    this.icon,
    this.color,
    this.colorText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0,left: 40.0,right: 40.0,bottom: 20.0),
      child: TextFormField(
        decoration: InputDecoration(
            prefixIcon: icon,
            hintText: Title,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: color),
              borderRadius: BorderRadius.circular(50),
            ),
            hintStyle: TextStyle(color: colorText),
            filled: true,
            fillColor: color,
            border: new OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  const Radius.circular(25.0),
                ))),
        obscureText: true,
        style: TextStyle(
          fontFamily: fontApp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
