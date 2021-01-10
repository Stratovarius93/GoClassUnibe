// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Student _$StudentFromJson(Map<String, dynamic> json) {
  return Student(
    studentId: json['studentId'] as int,
    name: json['name'] as String,
    lastName: json['lastName'] as String,
    career: json['career'] as String,
  );
}

Map<String, dynamic> _$StudentToJson(Student instance) => <String, dynamic>{
      'studentId': instance.studentId,
      'name': instance.name,
      'lastName': instance.lastName,
      'career': instance.career,
    };
