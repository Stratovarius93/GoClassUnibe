import 'package:GoClassUnibe/constants/Colors.dart';
import 'package:GoClassUnibe/providers/ScheduleProvider.dart';
import 'package:GoClassUnibe/widgets/generics/mainApp/schedule/ScheduleDayButton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScheduleDayTopButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final scheduleProvider = Provider.of<ScheduleProvider>(context);
    return Container(
      height: 100,
      child: ListView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [
          ToggleButtons(
            color: colorAppTextDark,
            fillColor: Colors.transparent,
            splashColor: Colors.transparent,
            renderBorder: false,
            children: scheduleProvider.getWeekDaysList().map((item) {
              var _index = scheduleProvider.getWeekDaysList().indexOf(item);
              return ScheduleDayButton(
                day: item,
                colorCircle: (scheduleProvider.getBoolSelected()[_index])
                    ? colorAppBlue
                    : Colors.white,
                colorText: (scheduleProvider.getBoolSelected()[_index])
                    ? Colors.white
                    : colorAppBlue,
              );
            }).toList(),
            onPressed: (int index) {
              scheduleProvider.setIndex(index);
            },
            isSelected: scheduleProvider.getBoolSelected(),
          )
        ],
      ),
    );
  }
}
