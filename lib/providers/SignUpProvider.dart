import 'package:GoClassUnibe/models/StudentModel.dart';
import 'package:flutter/material.dart';

class SignUpProvider with ChangeNotifier {
  int _studentID;
  Student _student;
  String _email = '';
  String _password = '';
  String _repeatPassword = '';
  bool _status = false;

  bool get getStatus => _status;

  set setStatus(bool status) {
    _status = status;
    notifyListeners();
  }

  bool validateEqualPassword(String password1, String password2) {
    if (password2 == password1) {
      return true;
    } else {
      return false;
    }
  }

  String get getRepeatPassword => _repeatPassword;

  set setRepeatPassword(String repeatPassword) {
    _repeatPassword = repeatPassword;
    //print(repeatPassword);
    notifyListeners();
  }

  String get getPassword => _password;

  set setPassword(String password) {
    _password = password;
    notifyListeners();
  }

  String get getEmail => _email;

  set setEmail(String email) {
    _email = email;
    notifyListeners();
  }

  Student get getStudent => _student;

  set setStudent(Student student) {
    _student = student;
    notifyListeners();
  }

  int get getStudentID => _studentID;
  set setStudentID(int studentID) {
    this._studentID = studentID;
    notifyListeners();
  }
}
