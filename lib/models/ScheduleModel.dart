import 'package:flutter/material.dart';

class ScheduleSignature {
  int timeStart;
  int timeEnd;
  String name;
  String classRoom;
  String teacher;
  String career;
  String day;
  Color color;
  ScheduleSignature(
      {@required this.timeStart,
      @required this.timeEnd,
      @required this.name,
      this.classRoom,
      this.teacher,
      this.career,
      this.day,
      this.color});

  @override
  String toString() {
    // TODO: implement toString
    return '[$timeStart, $timeEnd, $name, $day, $color, $classRoom, $teacher]\r\n';
  }

}
