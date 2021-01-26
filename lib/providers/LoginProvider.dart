import 'package:GoClassUnibe/preferences/userPreferences.dart';
import 'package:flutter/material.dart';

class LoginProvider with ChangeNotifier {
  String _email = '';
  String _password = '';
  int _studentID;
  bool _status = false;

  final _prefs = new UserPreferences();

  bool get getStatus => _status;

  set setStatus(bool status) {
    _status = status;
    notifyListeners();
  }

  int get getStudentID => _studentID;

  set setStudentID(int studentID) {
    _studentID = studentID;
  }

  String get getEmail => _email;
  set setEmail(String email) {
    this._email = email;
    notifyListeners();
  }

  String get getPassword => _password;
  set setPassword(String password) {
    this._password = password;
    notifyListeners();
  }

  disposeLogin() {
    _prefs.studentID = 0;
    _prefs.token = '';
  }
}
