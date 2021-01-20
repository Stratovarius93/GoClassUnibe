import 'package:GoClassUnibe/models/RegistrationModel.dart';
import 'package:GoClassUnibe/requests/SQLServerRequest.dart';
import 'package:flutter/material.dart';

class RegistrationProvider with ChangeNotifier {
  List<Registration> _registrationList = [];

  RegistrationProvider() {
    this.getRegistrationByID();
  }

  getRegistrationByID() async {
    try {
      await SQLServerRequest().fetchRegistration().then((res) {
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
