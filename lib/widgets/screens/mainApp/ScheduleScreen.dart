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

class ScheduleScreen extends StatelessWidget {
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
}
