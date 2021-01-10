import 'package:json_annotation/json_annotation.dart';

/// This allows the `Location` class to access private members in
/// the generated file.
part 'student.g.dart';

@JsonSerializable()
class Student {
  Student({
  this.studentId,
    this.name,
    this.lastName,
    this.career,
  });
   @JsonKey(name: 'studentId')
  int studentId;
   @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'lastName')
  String lastName;
  @JsonKey(name: 'career')
  String career;

  factory Student.fromJson(Map<String, dynamic> json) =>
      _$StudentFromJson(json);

  Map<String, dynamic> toJson() => _$StudentToJson(this);
}