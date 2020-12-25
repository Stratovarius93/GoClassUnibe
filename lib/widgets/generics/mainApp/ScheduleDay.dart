import 'package:GoClassUnibe/constants/Colors.dart';
import 'package:GoClassUnibe/constants/Fonts.dart';
import 'package:GoClassUnibe/data/exampleSchedule.dart';
import 'package:GoClassUnibe/models/scheduleModels.dart';
import 'package:flutter/material.dart';

final int _indexMaX =
    10; //numero de horas m'aximas por dia contando desde las 7 AM
List<int> _listIndex; //lista en blanco de indices
final int _itemMaxLenght = 3; //limite maximo de horas por materia

List<ScheduleSignature> _listItemFinal = [];
_ScheduleDayState globalState;

class ScheduleDay extends StatefulWidget {
  @override
  _ScheduleDayState createState() => _ScheduleDayState();
}

class _ScheduleDayState extends State<ScheduleDay> {
  @override
  void initState() {
    super.initState();
    globalState = this;
    _listIndex = List<int>.generate(_indexMaX, (int item) => item);
    _listItemFinal = _generateEmptyList(_indexMaX);
    List<ScheduleSignature> _listDivided = _listDivider(listItem);
    _generateFinalList(_listDivided, _indexMaX);
  }

  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ReorderableListView(
      onReorder: (int oldIndex, int newIndex) {
        setState(() {
          if (newIndex > oldIndex) {
            newIndex -= 1;
          }
          final ScheduleSignature newString = _listItemFinal.removeAt(oldIndex);
          _listItemFinal.insert(newIndex, newString);
          for (var i = 0, len = _listIndex.length; i < len; ++i) {
            _listItemFinal[i].timeStart = _listIndex[i] + 7;
          }
          for (var i = 0, len = _listIndex.length; i < len; ++i) {
            _listItemFinal[i].timeEnd = (_listIndex[i] + 1) + 7;
          }
        });
      },
      children: _listItemFinal.map((item) {
        var index = _listItemFinal.indexOf(item);
        if (item.name == 'Default') {
          return ElementDefault(
            key: UniqueKey(),
            title: item.timeStart.toString(),
          );
        } else {
          return ElementActive(
            key: UniqueKey(),
            title: item.name,
            color: item.color,
            indexIn: item.timeStart,
            indexOut: item.timeEnd,
            index: index,
          );
        }
      }).toList(),
    );
  }
}

class ElementDefault extends StatelessWidget {
  final String title;
  const ElementDefault({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      margin: EdgeInsets.only(left: 16, right: 16, top: 4, bottom: 4),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.08),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Text(
          'Hora libre $title',
          style: TextStyle(
              color: Colors.grey.withOpacity(0.5),
              fontSize: 20,
              fontFamily: fontApp),
        ),
      ),
    );
  }
}

class ElementActive extends StatelessWidget {
  final int indexIn;
  final int indexOut;
  final Color color;
  final String title;
  final String subtitle;
  final int index;

  const ElementActive(
      {Key key,
      this.color,
      this.title,
      this.subtitle,
      this.indexIn,
      this.indexOut,
      this.index})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        margin: EdgeInsets.all(4),
        padding: EdgeInsets.all(4),
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(8), color: color),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              indexIn.toString().padLeft(2, '0') + ':00',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontFamily: fontApp,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              indexOut.toString().padLeft(2, '0') + ':00',
              style: TextStyle(
                  fontSize: 16, fontFamily: fontApp, color: Colors.white),
            ),
          ],
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
            color: colorAppTextDark,
            fontFamily: fontApp,
            fontWeight: FontWeight.w500),
      ),
      subtitle: Text(
        "Aula A4",
        style: TextStyle(color: colorAppTextLight, fontFamily: fontApp),
      ),
      //trailing: _popupMenuSignature(index),
      trailing: _PopupMenuItem(
        index: index,
      ),
    );
  }
}

class _PopupMenuItem extends StatefulWidget {
  final int index;
  _PopupMenuItem({Key key, this.index}) : super(key: key);
  @override
  __PopupMenuItemState createState() => __PopupMenuItemState();
}

class __PopupMenuItemState extends State<_PopupMenuItem> {
  @override
  Widget build(BuildContext context) {
    List<String> _values = [
      'Añadir 1 hora',
      'Restar 1 hora',
      'Mover a día...',
      'Añadir hora libre antes',
      'Añadir hora libre después'
    ];
    return PopupMenuButton<int>(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      onSelected: (int value) {
        if (value == 0) {
          print('Add Hour ${_listItemFinal[widget.index].name}');
          if (_isMaxLength(_listItemFinal, _listItemFinal[widget.index].name) ==
              true) {
            print('Supera el maximo');
          } else {
            print('Anadiendo hora');
            _addHour(_listItemFinal, widget.index);
            globalState.setState(() {});
          }
        } else if (value == 1) {
          print('restar 1 hora');
        } else {
          print('mover a dia');
        }
      },
      elevation: 4,
      offset: Offset(0, 100),
      itemBuilder: (BuildContext context) {
        return _values.map((item) {
          var index = _values.indexOf(item);
          return PopupMenuItem(
            child: Text(
              item,
              style: TextStyle(color: colorAppTextDark, fontFamily: fontApp),
            ),
            value: index,
          );
        }).toList();
      },
    );
  }
}

bool _isMaxLength(List<ScheduleSignature> list, String name) {
  int sum = 0;
  for (var i = 0, len = list.length; i < len; ++i) {
    if (name == list[i].name) {
      sum++;
    }
  }
  if (sum >= _itemMaxLenght) {
    return true;
  } else {
    return false;
  }
}

void _addHour(List<ScheduleSignature> list, int index) {
  int defaultSum = 0;
  for (var i = 0, len = list.length; i < len; ++i) {
    if (list[i].name == 'Default') {
      defaultSum++;
    }
  }
  if (defaultSum >= 1) {
    int length = _listItemFinal.length - 1;
    for (var i = 0, len = _listItemFinal.length; i < len; ++i) {
      if (_listItemFinal[length].name == 'Default') {
        //print(_listItemFinal[length].name + ' ' + length.toString());
        break;
      } else {
        length = length - 1;
      }
    }

    //print(list);
    //print(length);
    ScheduleSignature newItem = ScheduleSignature(
        name: list[index].name,
        timeStart: list[index].timeStart,
        timeEnd: list[index].timeEnd,
        color: list[index].color);
    _listItemFinal.removeAt(length);
    _listItemFinal.insert(index, newItem);
    for (var i = 0, len = _listIndex.length; i < len; ++i) {
      _listItemFinal[i].timeStart = _listIndex[i] + 7;
    }
    for (var i = 0, len = _listIndex.length; i < len; ++i) {
      _listItemFinal[i].timeEnd = (_listIndex[i] + 1) + 7;
    }
    print('Hour added');
  } else {
    print('There is not space available');
  }
}

List<ScheduleSignature> _listDivider(List<ScheduleSignature> list) {
  List<int> listIndex = [];
  List<ScheduleSignature> newList = [];
  int sum = 0;
  for (var i = 0, len = list.length; i < len; ++i) {
    listIndex.add(list[i].timeEnd - list[i].timeStart);
    sum = sum + (list[i].timeEnd - list[i].timeStart);
  }
  //print(listIndex);
  //print(sum);
  if (sum <= _indexMaX) {
    for (var i = 0, len = list.length; i < len; ++i) {
      if (list[i].timeEnd - list[i].timeStart > 1) {
        for (var j = 0, len = (list[i].timeEnd - list[i].timeStart);
            j < len;
            ++j) {
          newList.add(ScheduleSignature(
              timeStart: list[i].timeStart + j,
              timeEnd: (list[i].timeStart + j + 1),
              name: list[i].name,
              color: list[i].color));
        }
      } else {
        newList.add(ScheduleSignature(
            timeStart: list[i].timeStart,
            timeEnd: list[i].timeEnd,
            name: list[i].name,
            color: list[i].color));
      }
    }
  } else {
    print('ERROR: The limit should must be less than $_indexMaX');
    for (var i = 0, len = list.length; i < len; ++i) {
      if (list[i].timeEnd - list[i].timeStart > 1) {
        newList.add(ScheduleSignature(
            timeStart: list[i].timeStart,
            timeEnd: list[i].timeStart + 1,
            name: list[i].name,
            color: list[i].color));
        print(
            'Changed the size of ${list[i].name}, from ${(list[i].timeEnd - list[i].timeStart)} to 1');
      } else {
        newList.add(ScheduleSignature(
            timeStart: list[i].timeStart,
            timeEnd: list[i].timeEnd,
            name: list[i].name,
            color: list[i].color));
      }
    }
  }
  return newList;
}

List<ScheduleSignature> _generateEmptyList(int indexMax) {
  List<ScheduleSignature> _listIndex = List<ScheduleSignature>.generate(
      indexMax,
      (int item) => ScheduleSignature(
          timeStart: item + 7,
          timeEnd: (item + 7) + 1,
          name: 'Default',
          color: Colors.transparent));
  return _listIndex;
}

void _generateFinalList(List<ScheduleSignature> listDivided, int indexMax) {
  for (var i = 0, len = indexMax; i < len; ++i) {
    for (var j = 0, len = listDivided.length; j < len; ++j) {
      if (i == listDivided[j].timeStart - 7) {
        _listItemFinal[i] = listDivided[j];
      }
    }
  }
  //print(_listItemFinal.toString());
}
