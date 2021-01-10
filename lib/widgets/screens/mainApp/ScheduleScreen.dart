import 'package:GoClassUnibe/constants/Colors.dart';
import 'package:GoClassUnibe/providers/Schedule2Provider.dart';
import 'package:GoClassUnibe/providers/StudentProvider.dart';
import 'package:GoClassUnibe/widgets/generics/mainApp/CategoryText.dart';
import 'package:GoClassUnibe/widgets/generics/mainApp/LoadingCircle.dart';
import 'package:GoClassUnibe/widgets/generics/mainApp/schedule/ScheduleAppBar.dart';
import 'package:GoClassUnibe/widgets/generics/mainApp/schedule/ScheduleDayTopButtons.dart';
import 'package:GoClassUnibe/widgets/generics/mainApp/schedule/ScheduleReorderableList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScheduleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final schedule2Provider = Provider.of<Schedule2Provider>(context);

    final studentProvider = Provider.of<StudentProvider>(context);
    if (studentProvider.getStudent() != null) {
      
    schedule2Provider.setCareer(studentProvider.getStudent().career);
    }


    return Scaffold(
      backgroundColor: colorAppBackground,
      appBar: scheduleAppBar(),
      body: (schedule2Provider.getListFull().length > 0)
      ?Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        ScheduleDayTopButtons(),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, bottom: 16),
          child: CategoryText(
            title: schedule2Provider
                .getWeekDaysList()[schedule2Provider.getIndex()],
          ),
        ),
        ReorderableListItems(),
      ])
      :Container(
          child: LoadingCircle( loadingText: 'Cargando horario...', )),
    );
  }
}


