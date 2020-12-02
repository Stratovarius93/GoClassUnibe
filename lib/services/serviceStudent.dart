import 'package:flutter/material.dart';

class StudentData with ChangeNotifier {
  String _name = 'Scarlett';
  String _lartName = 'Johansson';
  String _email = "scarlett2020@hotmail.es";
  String _career = "Ingeniería de Software";
  int _idNumber = 1726499393;

  get getName {
    return _name;
  }

  get getLastName {
    return _lartName;
  }

  get getEmail {
    return _email;
  }

  set setEmail(String email) {
    this._email = email;
    notifyListeners();
  }

  get getCareer {
    return _career;
  }

  get getIdNumber {
    return _idNumber;
  }
}
