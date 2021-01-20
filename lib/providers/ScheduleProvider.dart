import 'package:GoClassUnibe/constants/Colors.dart';
import 'package:GoClassUnibe/models/Schedule2Model.dart';
import 'package:GoClassUnibe/models/ScheduleModel.dart';
import 'package:GoClassUnibe/requests/GSheetsRequest.dart';
import 'package:GoClassUnibe/utils/ScheduleUtils.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class ScheduleProvider with ChangeNotifier {
  bool connectionStatus = false;
  List<Schedule> _scheduleList = [];
  List<ScheduleSignature> _listFull = [];
  int _indexMax = 10;
  List<ScheduleSignature> _listDay0 = [];
  List<ScheduleSignature> _listDay1 = [];
  List<ScheduleSignature> _listDay2 = [];
  List<ScheduleSignature> _listDay3 = [];
  List<ScheduleSignature> _listDay4 = [];
  int _index = 0;
  List<ScheduleSignature> _list = [];
  List<ScheduleSignature> _emptyList = [];
  List<bool> _boolSelected = [
    false,
    false,
    false,
    false,
    false,
  ];
  List<int> _listIndex = [];
  List<String> _weekDays = [
    'lunes',
    'martes',
    'miércoles',
    'jueves',
    'viernes',
  ];
  String _currentDay;
  var _date = DateTime.now();

  String _career;
  List<Schedule> _newListSchedule = [];

  List<ScheduleSignature> _dashboardList = [];

  ScheduleProvider() {
    //this._getCurrentDay();
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
    //print(_newListSchedule.toString());
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
      _listFull.add(scheduleSignature);
    }

    //print(_listFull.toString());
    _getCurrentDay();
    //print(_listFull.toString());
    _setDashboard(_index, _listFull);
    //print(getDashboardList().toString());
    notifyListeners();

    this.connectionStatus = true;
    print('GSheets connected');

  }

  List<Schedule> _getScheduleList() => _scheduleList;

  _setScheduleList(List<Schedule> scheduleList) {
    _scheduleList = scheduleList;
  }

  String getCurrentDay() => _currentDay;

  String _getCareer() => _career;
  setCareer(String career) {
    _career = career;
  }

  List<ScheduleSignature> getDashboardList() => _dashboardList;
  _setDashboard(int indexDay, List<ScheduleSignature> list) {
    List<ScheduleSignature> _list = [];
    switch (indexDay) {
      case 0:
        _list = validateListDay(list, _weekDays[0]);
        break;
      case 1:
        _list = validateListDay(list, _weekDays[1]);
        break;
      case 2:
        _list = validateListDay(list, _weekDays[2]);
        break;
      case 3:
        _list = validateListDay(list, _weekDays[3]);
        break;
      case 4:
        _list = validateListDay(list, _weekDays[4]);
        break;
      default:
        _list = validateListDay(list, _weekDays[0]);
        break;
    }
    _dashboardList = _list;
  }

  _getCurrentDay() {
    initializeDateFormatting();
    _currentDay = DateFormat.EEEE('es_ES').format(_date);
    //print(_currentDay);

    for (var i = 0, len = _weekDays.length; i < len; ++i) {
      if (_weekDays[i] == _currentDay) {
        _index = i;
        _boolSelected[i] = true;
      } else if (_currentDay == 'sábado' || _currentDay == 'domingo') {
        _index = 0;
        _boolSelected[0] = true;
      }
    }
    //_listFull = dataList;
    //print(_listFull.toString());
    _listIndex = List<int>.generate(_indexMax, (int item) => item);

    //anadimos los elementos en cada array de cada dia
    _listDay0 = validateListDay(_listFull, _weekDays[0]);
    _listDay1 = validateListDay(_listFull, _weekDays[1]);
    _listDay2 = validateListDay(_listFull, _weekDays[2]);
    _listDay3 = validateListDay(_listFull, _weekDays[3]);
    _listDay4 = validateListDay(_listFull, _weekDays[4]);

    //dividimos cada array en horas
    _listDay0 = listDivider(_listDay0, _indexMax);
    _listDay1 = listDivider(_listDay1, _indexMax);
    _listDay2 = listDivider(_listDay2, _indexMax);
    _listDay3 = listDivider(_listDay3, _indexMax);
    _listDay4 = listDivider(_listDay4, _indexMax);

    _listDay0 = getFinaListDay(_listDay0, _indexMax);
    _listDay1 = getFinaListDay(_listDay1, _indexMax);
    _listDay2 = getFinaListDay(_listDay2, _indexMax);
    _listDay3 = getFinaListDay(_listDay3, _indexMax);
    _listDay4 = getFinaListDay(_listDay4, _indexMax);

    //print(_listDay0);
    _setDayListByDay(_index);
    notifyListeners();
  }

  List<ScheduleSignature> getListFull() => _listFull;

  List<ScheduleSignature> getFinaListDay(
      List<ScheduleSignature> listDivided, int indexMax) {
    _emptyList = generateEmptyList(indexMax);
    generateFinalList(listDivided, _emptyList, indexMax);
    return _emptyList;
  }

  setIndex(int index) {
    _index = index;
    _setDayListByDay(index);
    _setButtonSelected(index);
    notifyListeners();
  }

  _setButtonSelected(int index) {
    for (int buttonIndex = 0;
        buttonIndex < _boolSelected.length;
        buttonIndex++) {
      if (buttonIndex == index) {
        _boolSelected[buttonIndex] = true;
      } else {
        _boolSelected[buttonIndex] = false;
      }
    }
    notifyListeners();
  }

  getBoolSelected() => _boolSelected;

  int getIndex() => _index;

  List<String> getWeekDaysList() => _weekDays;

  List<ScheduleSignature> getSignatureList() => _list;
  _setListFinal(List<ScheduleSignature> list) {
    _list = list;
  }

  _setDayListByDay(int index) {
    switch (index) {
      case 0:
        {
          _setListFinal(_listDay0);
          notifyListeners();
        }
        break;
      case 1:
        {
          _setListFinal(_listDay1);
          notifyListeners();
        }
        break;
      case 2:
        {
          _setListFinal(_listDay2);
          notifyListeners();
        }
        break;
      case 3:
        {
          _setListFinal(_listDay3);
          notifyListeners();
        }
        break;
      case 4:
        {
          _setListFinal(_listDay4);
          notifyListeners();
        }
        break;
      default:
        {
          _setListFinal(_listDay0);
          notifyListeners();
        }
        break;
    }
  }

  _reorderListDay(List<ScheduleSignature> list, int oldIndex, int newIndex) {
    final item = list.removeAt(oldIndex);
    list.insert(newIndex, item);
    reorderTime(list, _listIndex);
    notifyListeners();
  }

  setListFinal(int oldIndex, int newIndex) {
    //print(_index);
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }
    switch (_index) {
      case 0:
        _reorderListDay(_listDay0, oldIndex, newIndex);
        break;
      case 1:
        _reorderListDay(_listDay1, oldIndex, newIndex);
        break;
      case 2:
        _reorderListDay(_listDay2, oldIndex, newIndex);
        break;
      case 3:
        _reorderListDay(_listDay3, oldIndex, newIndex);
        break;
      case 4:
        _reorderListDay(_listDay4, oldIndex, newIndex);
        break;
      default:
        {
          final item = _listDay0.removeAt(oldIndex);
          _listDay0.insert(newIndex, item);
          notifyListeners();
        }
        break;
    }
  }

  //===========================
  // selected signature
  //===========================
  List<String> getDaySelected() {
    List<String> _list = [];
    _list.addAll(_weekDays);
    _list.removeAt(_index);
    return _list;
  }

  setSelectecSignature(int value, BuildContext context, int index) {
    switch (value) {
      case 0:
        {
          addFreeHourAbove(
              _getDayListByIndex(), index, _indexMax, _listIndex, context);
          notifyListeners();
        }
        break;
      case 1:
        {
          addFreeHourBelow(
              _getDayListByIndex(), index, _indexMax, _listIndex, context);
          notifyListeners();
        }
        break;
      case 2:
        {
          int _dayIndex = 0;
          for (var i = 0, len = _weekDays.length; i < len; ++i) {
            if (getDaySelected()[0] == _weekDays[i]) {
              _dayIndex = i;
            }
          }
          moveToDay(_getDayListByIndex(), _getDayToByIndex(_dayIndex), index,
              _listIndex, context);
          notifyListeners();
        }
        break;
      case 3:
        {
          int _dayIndex = 1;
          for (var i = 0, len = _weekDays.length; i < len; ++i) {
            if (getDaySelected()[1] == _weekDays[i]) {
              _dayIndex = i;
            }
          }
          moveToDay(_getDayListByIndex(), _getDayToByIndex(_dayIndex), index,
              _listIndex, context);
          notifyListeners();
        }
        break;
      case 4:
        {
          int _dayIndex = 2;
          for (var i = 0, len = _weekDays.length; i < len; ++i) {
            if (getDaySelected()[2] == _weekDays[i]) {
              _dayIndex = i;
            }
          }
          moveToDay(_getDayListByIndex(), _getDayToByIndex(_dayIndex), index,
              _listIndex, context);
          notifyListeners();
        }
        break;
      case 5:
        {
          int _dayIndex = 3;
          for (var i = 0, len = _weekDays.length; i < len; ++i) {
            if (getDaySelected()[3] == _weekDays[i]) {
              _dayIndex = i;
            }
          }
          moveToDay(_getDayListByIndex(), _getDayToByIndex(_dayIndex), index,
              _listIndex, context);
          notifyListeners();
        }
        break;
      default:
        print('Error in selected option');
        break;
    }
  }

  List<ScheduleSignature> _getDayListByIndex() {
    List<ScheduleSignature> list = [];
    switch (_index) {
      case 0:
        list = _listDay0;
        break;
      case 1:
        list = _listDay1;
        break;
      case 2:
        list = _listDay2;
        break;
      case 3:
        list = _listDay3;
        break;
      case 4:
        list = _listDay4;
        break;
      default:
        {
          list = _listDay0;
        }
        break;
    }
    return list;
  }

  setSelectecFreeHourAddHour(BuildContext context, int index) {
    addFreeHour(_getDayListByIndex(), index, _indexMax, _listIndex, context);
    notifyListeners();
  }

  setSelectecFreeHourRemoveHour(int index) {
    deleteFreeHour(_getDayListByIndex(), index, _indexMax, _listIndex);
    notifyListeners();
  }

  List<ScheduleSignature> _getDayToByIndex(int day) {
    List<ScheduleSignature> list = [];
    switch (day) {
      case 0:
        list = _listDay0;
        break;
      case 1:
        list = _listDay1;
        break;
      case 2:
        list = _listDay2;
        break;
      case 3:
        list = _listDay3;
        break;
      case 4:
        list = _listDay4;
        break;
      default:
        {
          list = _listDay0;
        }
        break;
    }
    return list;
  }
}
