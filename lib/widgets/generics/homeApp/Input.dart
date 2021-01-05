import 'package:flutter/material.dart';
import 'package:GoClassUnibe/constants/Fonts.dart';

class CreateEmailInput extends StatelessWidget {
  final String Title;
  final Icon icon;
  final Color color;
  final Color colorText;

  const CreateEmailInput({
    Key key,
    this.Title,
    this.icon,
    this.color,
    this.colorText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width * 0.90,
      padding: const EdgeInsets.only(top: 40.0, left: 15.0, right: 15.0),
      child: TextFormField(
        maxLength: 10,
        keyboardType: TextInputType.number,
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
                  const Radius.circular(50.0),
                ))),
        style: TextStyle(
          fontFamily: fontApp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
