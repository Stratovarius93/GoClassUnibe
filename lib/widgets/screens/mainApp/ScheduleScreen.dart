import 'package:GoClassUnibe/constants/Colors.dart';
import 'package:GoClassUnibe/providers/ScheduleProvider.dart';
import 'package:GoClassUnibe/providers/StudentProvider.dart';
import 'package:GoClassUnibe/widgets/generics/mainApp/CategoryText.dart';
import 'package:GoClassUnibe/widgets/generics/mainApp/LoadingCircle.dart';
import 'package:GoClassUnibe/widgets/generics/mainApp/schedule/ScheduleAppBar.dart';
import 'package:GoClassUnibe/widgets/generics/mainApp/schedule/ScheduleDayTopButtons.dart';
import 'package:GoClassUnibe/widgets/generics/mainApp/schedule/ScheduleReorderableList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

  @override
  Widget build(BuildContext context) {
    final scheduleProvider = Provider.of<ScheduleProvider>(context);

    //final studentProvider = Provider.of<StudentProvider>(context);
    //if (studentProvider.getStudent() != null) {
      
    //scheduleProvider.setCareer(studentProvider.getStudent().career);
    //}


    return Scaffold(
      backgroundColor: colorAppBackground,
      appBar: scheduleAppBar(),
      body: (scheduleProvider.getListFull().length > 0)
      ?Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        ScheduleDayTopButtons(),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, bottom: 16),
          child: CategoryText(
            title: scheduleProvider
                .getWeekDaysList()[scheduleProvider.getIndex()],
          ),
        ),
        ReorderableListItems(),
      ])
      :Container(
          child: LoadingCircle( loadingText: 'Cargando horario...', )),
    );
  }

  Widget _toggleButtonsDay() {
    return ToggleButtons(
      color: colorAppTextDark,
      fillColor: Colors.transparent,
      splashColor: Colors.transparent,
      renderBorder: false,
      children: _dayList.map((val) {
        var subIndex = _dayList.indexOf(val);
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 16),
          child: Container(
            decoration: BoxDecoration(boxShadow: <BoxShadow>[boxShadowApp]),
            child: CircleAvatar(
                radius: (MediaQuery.of(context).size.width * 0.15) / 2,
                backgroundColor:
                    _daySelected[subIndex] ? colorTextBlue : Colors.white,
                child: Text(
                  val[0].toUpperCase(),
                  style: TextStyle(
                      color: _daySelected[subIndex]
                          ? Colors.white
                          : colorAppTextDark,
                      fontFamily: fontApp,
                      fontWeight: FontWeight.w800,
                      fontSize: 30),
                )),
          ),
        );
      }).toList(),
      onPressed: (int index) {
        setState(() {
          for (int buttonIndex = 0;
              buttonIndex < _daySelected.length;
              buttonIndex++) {
            if (buttonIndex == index) {
              _daySelected[buttonIndex] = true;
            } else {
              _daySelected[buttonIndex] = false;
            }
          }
          _index = index;
          print(_dayList[index]);
        });
      },
      isSelected: _daySelected,
    );
  }
}


