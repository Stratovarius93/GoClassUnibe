import 'package:GoClassUnibe/constants/Colors.dart';
import 'package:GoClassUnibe/providers/Schedule2Provider.dart';
import 'package:GoClassUnibe/widgets/generics/mainApp/schedule/ScheduleDayButton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScheduleDayTopButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final schedule2Provider = Provider.of<Schedule2Provider>(context);
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
            children: schedule2Provider.getWeekDaysList().map((item) {
              var _index = schedule2Provider.getWeekDaysList().indexOf(item);
              return ScheduleDayButton(
                day: item,
                colorCircle: (schedule2Provider.getBoolSelected()[_index])
                    ? colorAppBlue
                    : Colors.white,
                colorText: (schedule2Provider.getBoolSelected()[_index])
                    ? Colors.white
                    : colorAppBlue,
              );
            }).toList(),
            onPressed: (int index) {
              schedule2Provider.setIndex(index);
            },
            isSelected: schedule2Provider.getBoolSelected(),
          )
        ],
      ),
    );
  }
}
