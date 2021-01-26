import 'package:flutter/material.dart';

void showSnackBar(String message, BuildContext context) {
  final snackBar = SnackBar(
    content: Text(message),
    behavior: SnackBarBehavior.floating,
  );
  Scaffold.of(context).showSnackBar(snackBar);
}
