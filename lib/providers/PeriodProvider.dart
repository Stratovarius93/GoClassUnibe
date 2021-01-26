import 'package:GoClassUnibe/models/PeriodModel.dart';
import 'package:GoClassUnibe/models/RegistrationModel.dart';
import 'package:GoClassUnibe/preferences/userPreferences.dart';
import 'package:GoClassUnibe/requests/SQLServerRequest.dart';
import 'package:flutter/material.dart';

class PeriodProvider with ChangeNotifier {
  List<Period> _periodlist = [];
  List<Registration> _registrationList = [];
  List<Period> _currentPeriod = [];

  final _prefs = new UserPreferences();
  PeriodProvider() {
    this.getPeriodByID();
  }
  getPeriodByID() async {
    try {
      final id = await _prefs.studentID;
      await SQLServerRequest().fetchPeriod(id.toString()).then((res) {
        if (res.statusCode == 200) {
          final decodedData = periodFromJson(res.body);
          List<Period> list = [];
          list.addAll(decodedData);
          _setPeriodlist(list);
        } else {
          throw Exception('Failed to load data');
        }
      });

      await SQLServerRequest().fetchRegistration(id.toString()).then((res) {
        if (res.statusCode == 200) {
          final decodedData = registrationFromJson(res.body);
          List<Registration> list = [];
          list.addAll(decodedData);
          _setRegistrationList(list);
        } else {
          throw Exception('Failed to load data');
        }
      });
    } catch (e) {
      print('No internet connection');
    }
    List<List<int>> _currenPeriodInt = [];
    List<List<int>> _listInt = [];
    for (var i = 0, len = _registrationList.length; i < len; ++i) {
      List<int> list = [];
      _listInt.add(list);
      for (var j = 0, len = _periodlist.length; j < len; ++j) {
        if (_registrationList[i].careerId == _periodlist[j].careerId) {
          _listInt[i].add(_periodlist[j].periodId);
        }
      }
    }
    for (var i = 0, len = _listInt.length; i < len; ++i) {
      var maxVal = _listInt[i][0];
      for (var j = 0; j < _listInt[i].length; j++) {
        if (_listInt[i][j] > maxVal) {
          maxVal = _listInt[i][j];
        }
      }
      List<int> list = [_registrationList[i].careerId, maxVal];
      _currenPeriodInt.add(list);
    }
    List<Period> _listCurrentPeriod = [];
    for (var i = 0, len = _currenPeriodInt.length; i < len; ++i) {
      for (var j = 0, len = _periodlist.length; j < len; ++j) {
        if (_currenPeriodInt[i][1] == _periodlist[j].periodId) {
          _listCurrentPeriod.add(_periodlist[j]);
        }
      }
    }
    _setCurrentPeriod(_listCurrentPeriod);
    notifyListeners();
  }

  List<Period> getPeriodlist() => _periodlist;

  _setPeriodlist(List<Period> periodlist) {
    _periodlist = periodlist;
    notifyListeners();
  }

  List<Period> getCurrentPeriod() => _currentPeriod;

  _setCurrentPeriod(List<Period> periodlist) {
    _currentPeriod = periodlist;
    notifyListeners();
  }

  List<Registration> getRegistrationList() => _registrationList;
  _setRegistrationList(List<Registration> registrationList) {
    _registrationList = registrationList;
    notifyListeners();
  }
}
