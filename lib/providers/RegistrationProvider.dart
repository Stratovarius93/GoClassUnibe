import 'package:GoClassUnibe/models/RegistrationModel.dart';
import 'package:GoClassUnibe/preferences/userPreferences.dart';
import 'package:GoClassUnibe/requests/SQLServerRequest.dart';
import 'package:flutter/material.dart';

class RegistrationProvider with ChangeNotifier {
  List<Registration> _registrationList = [];

  final _prefs = new UserPreferences();
  RegistrationProvider() {
    this.getRegistrationByID();
  }

  getRegistrationByID() async {
    try {
      final id = await _prefs.studentID;
      await SQLServerRequest().fetchRegistration(id.toString()).then((res) {
        if (res.statusCode == 200) {
          final decodedData = registrationFromJson(res.body);
          List<Registration> list = [];
          list.addAll(decodedData);
          setRegistrationList(list);
          notifyListeners();
        } else {
          throw Exception('failed to load data');
        }
      });
    } catch (e) {
      print('No internet connection');
    }
  }

  List<Registration> getRegistrationList() => _registrationList;
  setRegistrationList(List<Registration> registrationList) {
    _registrationList = registrationList;
    notifyListeners();
  }
}
