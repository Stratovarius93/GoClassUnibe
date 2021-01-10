import 'package:GoClassUnibe/constants/Colors.dart';
import 'package:GoClassUnibe/models/Schedule2Model.dart';
import 'package:GoClassUnibe/requests/GSheetsRequest.dart';
import 'package:flutter/material.dart';
import 'package:GoClassUnibe/models/ScheduleModel.dart';

class ScheduleProvider with ChangeNotifier {
  List<Schedule> _scheduleList = [];
  List<Schedule> _newListSchedule = [];
  List<ScheduleSignature> _newListScheduleFinal = [];
  String _career;


  ScheduleProvider() {
    this.getScheduleListGS();
  }
  getScheduleListGS() async {
    await GSheetsRequest().fetchSchedule().then((res) {
      if (res.statusCode == 200) {
        final decodedData = scheduleFromJson(res.body);
        List<Schedule> list = [];
        list.addAll(decodedData);
        _setScheduleList(list);
        //print(_scheduleList.toString());
      }
    });
    //print(_career);
    for (var i = 0, len = _getScheduleList().length; i < len; ++i) {
      if (_scheduleList[i].career == _getCareer()) {
        _newListSchedule.add(_scheduleList[i]);
      }
    }
    for (var i = 0, len = _newListSchedule.length; i < len; ++i) {
      ScheduleSignature scheduleSignature = ScheduleSignature(
          timeStart: _newListSchedule[i].timeStart,
          timeEnd: _newListSchedule[i].timeEnd,
          name: _newListSchedule[i].name,
          classRoom: _newListSchedule[i].classRoom,
          teacher: _newListSchedule[i].teacher,
          career: _newListSchedule[i].career,
          day: _newListSchedule[i].day,
          color: constantsListColors[i]);
      _newListScheduleFinal.add(scheduleSignature);
    }

    //print(_newListScheduleFinal.toString());
    notifyListeners();
  }

  List<ScheduleSignature> getScheduleListFinal() => _newListScheduleFinal;
  List<Schedule> _getScheduleList() => _scheduleList;

  _setScheduleList(List<Schedule> scheduleList) {
    _scheduleList = scheduleList;
  }

  String _getCareer() => _career;
  setCareer(String career) {
    _career = career;
  }
}
