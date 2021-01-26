import 'package:flutter/material.dart';

class ResetPasswordProvider with ChangeNotifier {
  bool _status = false;

  bool get getStatus => _status;

  set setStatus(bool status) {
    _status = status;
    notifyListeners();
  }

  String _email = '';

  String get getEmail => _email;

  set setEmail(String email) {
    _email = email;
    notifyListeners();
  }
}
