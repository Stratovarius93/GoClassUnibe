import 'package:GoClassUnibe/constants/Colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:GoClassUnibe/constants/Fonts.dart';

class CreateInput extends StatelessWidget {
  final String errorText;
  final String title;
  final Icon icon;
  final TextInputType textInputType;
  final bool obscureText;
  final int maxLength;
  final Function(String) onchanged;

  const CreateInput({
    Key key,
    this.title,
    this.icon,
    @required this.textInputType,
    @required this.obscureText,
    @required this.maxLength,
    this.onchanged, this.errorText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onchanged,
      obscureText: obscureText,
      maxLength: maxLength,
      keyboardType: textInputType,
      decoration: InputDecoration(
          errorText: errorText,
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide(color: Colors.transparent)),
          errorStyle: TextStyle(color: Colors.red, fontFamily: fontApp, fontSize: 10),
          counterStyle: TextStyle(fontSize: 0),
          prefixIcon: icon,
          hintText: title,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: colorInputBlueLight),
            borderRadius: BorderRadius.circular(50),
          ),
          hintStyle: TextStyle(color: colorAppSkyBlue),
          filled: true,
          fillColor: colorInputBlueLight,
          border: new OutlineInputBorder(
              borderRadius: const BorderRadius.all(
            const Radius.circular(50.0),
          ))),
      style: TextStyle(
        fontFamily: fontApp,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
