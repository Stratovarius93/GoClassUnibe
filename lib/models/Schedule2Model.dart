import 'dart:convert';

List<Schedule> scheduleFromJson(String str) =>
    List<Schedule>.from(json.decode(str).map((x) => Schedule.fromJson(x)));


class Schedule {
  Schedule({
    this.timeStart,
    this.timeEnd,
    this.name,
    this.classRoom,
    this.teacher,
    this.career,
    this.day,
  });

  int timeStart;
  int timeEnd;
  String name;
  String classRoom;
  String teacher;
  String career;
  String day;

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
        timeStart: json["timeStart"],
        timeEnd: json["timeEnd"],
        name: json["name"],
        classRoom: json["classRoom"],
        teacher: json["teacher"],
        career: json["career"],
        day: json["day"],
      );


  @override
  String toString() {
    // TODO: implement toString
    return '[$timeStart, $timeEnd, $name, $career]\r\n';
  }

}

