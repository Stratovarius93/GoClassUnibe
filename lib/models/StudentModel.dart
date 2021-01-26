import 'dart:convert';

List<Student> studentFromJson(String str) =>
    List<Student>.from(json.decode(str).map((x) => Student.fromJson(x)));

String studentToJson(Student data) => json.encode(data.toJson());

class Student {
  Student({
    this.studentId,
    this.name,
    this.lastName,
    this.career,
  });

  int studentId;
  String name;
  String lastName;
  String career;

  factory Student.fromJson(Map<String, dynamic> json) => Student(
        studentId: json["studentID"],
        name: json["name"],
        lastName: json["lastName"],
        career: json["career"],
      );
  Map<String, dynamic> toJson() => {
        "studentID": studentId,
        "name": name,
        "lastName": lastName,
        "career": career,
      };
}
