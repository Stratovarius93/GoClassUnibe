import 'dart:convert';

List<Registration> registrationFromJson(String str) => List<Registration>.from(
    json.decode(str).map((x) => Registration.fromJson(x)));

String registrationToJson(List<Registration> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Registration {
  Registration({
    this.registrationId,
    this.careerId,
    this.career,
  });

  int registrationId;
  int careerId;
  String career;

  factory Registration.fromJson(Map<String, dynamic> json) => Registration(
        registrationId: json["registrationID"],
        careerId: json["careerID"],
        career: json["career"],
      );

  Map<String, dynamic> toJson() => {
        "registrationID": registrationId,
        "careerID": careerId,
        "career": career,
      };
}
