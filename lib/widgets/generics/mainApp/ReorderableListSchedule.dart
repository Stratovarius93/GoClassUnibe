import 'package:GoClassUnibe/constants/Colors.dart';
import 'package:GoClassUnibe/constants/Fonts.dart';
import 'package:GoClassUnibe/models/scheduleModels.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:quiver/iterables.dart';

List<String> _timeList = [];
var _timeListSplit;

class ReorderableListSchedule extends StatefulWidget {
  ReorderableListSchedule({List<Signature> signatureList})
      : this.signatureList = signatureList ?? [];
  final List<Signature> signatureList;
  @override
  _ReorderableListScheduleState createState() =>
      _ReorderableListScheduleState();
}

class _ReorderableListScheduleState extends State<ReorderableListSchedule> {
  @override
  void initState() {
    super.initState();
    //schedule list

    for (var i = 0, len = widget.signatureList.length; i < len; ++i) {
      _timeList.add(widget.signatureList[i].timeStart);
      _timeList.add(widget.signatureList[i].timeEnd);
    }
    _timeListSplit = partition(_timeList, 2);
  }

  @override
  Widget build(BuildContext context) {
    return ReorderableListView(
      children: widget.signatureList.map((item) {
        var index = widget.signatureList.indexOf(item);
        Color colorTimeStart;
        Color colorTimeEnd;
        if (item.color == constantsListColors[2]) {
          colorTimeStart = constantsListColors[0];
          colorTimeEnd = constantsListColors[0];
        } else {
          colorTimeStart = Colors.white.withOpacity(0.8);
          colorTimeEnd = Colors.white.withOpacity(0.8);
        }
        return Container(
          color: Colors.white,
          key: UniqueKey(),
          child: ListTile(
            leading: Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                  color: item.color, borderRadius: BorderRadius.circular(8)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    //item.timeStart,
                    _timeListSplit.elementAt(index).elementAt(0),
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: fontApp,
                        //color: Colors.white.withOpacity(0.8),
                        color: colorTimeStart,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    //item.timeEnd,
                    _timeListSplit.elementAt(index).elementAt(1),
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: fontApp,
                        //color: Colors.white.withOpacity(0.8),
                        color: colorTimeEnd,
                        fontWeight: FontWeight.w300),
                  )
                ],
              ),
            ),
            title: Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                item.name,
                style: TextStyle(
                    fontSize: 18,
                    fontFamily: fontApp,
                    color: colorAppTextDark,
                    fontWeight: FontWeight.bold),
              ),
            ),
            subtitle: Text(
              item.description,
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: fontApp,
                  color: colorAppTextLight,
                  fontWeight: FontWeight.bold),
            ),
            trailing: _popupMenuSignature(index),
          ),
        );
      }).toList(),
      onReorder: (int oldIndex, int newIndex) {
        setState(() {
          if (newIndex > oldIndex) {
            newIndex -= 1;
          }
          final Signature newSignature =
              widget.signatureList.removeAt(oldIndex);
          widget.signatureList.insert(newIndex, newSignature);

          for (var i = 0, len = widget.signatureList.length; i < len; ++i) {
            widget.signatureList[i].timeStart =
                _timeListSplit.elementAt(i).elementAt(0);
            widget.signatureList[i].timeEnd =
                _timeListSplit.elementAt(i).elementAt(1);
          }
          print(widget.signatureList.toString());
        });
      },
    );
  }

  Widget _popupMenuSignature(int index) {
    List<String> _values = ['Añadir 1 hora', 'Restar 1 hora', 'Mover a día...'];
    String timeStart = widget.signatureList[index].timeStart;
    String timeEnd = widget.signatureList[index].timeEnd;
    return PopupMenuButton<int>(
      onSelected: (int value) {
        if (value == 0) {
          _addOneHour(timeStart, timeEnd);
        }
      },
      elevation: 4,
      offset: Offset(0, 100),
      itemBuilder: (BuildContext context) {
        return _values.map((item) {
          var index = _values.indexOf(item);
          return PopupMenuItem(
            child: Text(item),
            value: index,
          );
        }).toList();
      },
    );
  }

  void _addOneHour(String timeStart, String timeEnd) {
    TimeOfDay _parsedTimeStart = TimeOfDay(
        hour: int.parse(timeStart.split(":")[0]) + 1,
        minute: int.parse(timeStart.split(":")[1]));
    print(_parsedTimeStart);
    print('$timeStart $timeEnd');
  }
}
