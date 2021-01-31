import 'package:GoClassUnibe/preferences/userPreferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

final _prefs = new UserPreferences();
signOut(BuildContext context) {
  _prefs.studentID = 0;
  _prefs.token = '';
  _prefs.studentEmail = '';

  Phoenix.rebirth(context);
}
