import 'package:GoClassUnibe/constants/Colors.dart';
import 'package:GoClassUnibe/constants/Fonts.dart';
import 'package:flutter/material.dart';

void showAlert(BuildContext context, String text) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: Text(
          'Datos incorrectos',
          style: TextStyle(
              fontFamily: fontApp,
              color: colorAppTextDark,
              fontWeight: FontWeight.bold),
        ),
        content: Text(
          text,
          style: TextStyle(fontFamily: fontApp, color: colorAppTextDark),
        ),
        actions: [
          FlatButton(
            child: Text('Ok'),
            onPressed: () => Navigator.of(context).pop(),
          )
        ],
      );
    },
  );
}

void showAlertConnection(BuildContext context, String text) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: Text(
          'Error de conexión',
          style: TextStyle(
              fontFamily: fontApp,
              color: colorAppTextDark,
              fontWeight: FontWeight.bold),
        ),
        content: Text(
          text,
          style: TextStyle(fontFamily: fontApp, color: colorAppTextDark),
        ),
        actions: [
          FlatButton(
            child: Text('Ok'),
            onPressed: () => Navigator.of(context).pop(),
          )
        ],
      );
    },
  );
}
