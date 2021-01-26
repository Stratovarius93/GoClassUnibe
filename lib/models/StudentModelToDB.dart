import 'dart:convert';

StudentToDb studentToDbFromJson(String str) => StudentToDb.fromJson(json.decode(str));

String studentToDbToJson(StudentToDb data) => json.encode(data.toJson());

class StudentToDb {
    StudentToDb({
        this.studentId,
        this.name,
        this.lastName,
        this.career,
        this.email,
    });

    int studentId;
    String name;
    String lastName;
    String career;
    String email;

    factory StudentToDb.fromJson(Map<String, dynamic> json) => StudentToDb(
        studentId: json["studentID"],
        name: json["name"],
        lastName: json["lastName"],
        career: json["career"],
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "studentID": studentId,
        "name": name,
        "lastName": lastName,
        "career": career,
        "email": email,
    };
}

