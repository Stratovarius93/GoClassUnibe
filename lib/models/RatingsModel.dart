import 'dart:convert';

List<Rating> ratingFromJson(String str) =>
    List<Rating>.from(json.decode(str).map((x) => Rating.fromJson(x)));

class Rating {
  Rating({
    this.periodId,
    this.signatureName,
    this.registrationId,
    this.signatureId,
    this.ap1,
    this.ap2,
    this.ap3,
    this.finalRating,
    this.in1,
    this.in2,
    this.in3,
    this.finalIn,
    this.supplementaryExam,
    this.stateSignature,
  });

  int periodId;
  String signatureName;
  int registrationId;
  int signatureId;
  double ap1;
  double ap2;
  double ap3;
  double finalRating;
  int in1;
  int in2;
  int in3;
  int finalIn;
  int supplementaryExam;
  String stateSignature;

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        periodId: json["periodID"],
        signatureName: json["signatureName"],
        registrationId: json["registrationID"],
        signatureId: json["signatureID"],
        ap1: json["ap1"].toDouble(),
        ap2: json["ap2"].toDouble(),
        ap3: json["ap3"].toDouble(),
        finalRating: json["finalRating"].toDouble(),
        in1: json["in1"],
        in2: json["in2"],
        in3: json["in3"],
        finalIn: json["finalIn"],
        supplementaryExam: json["supplementaryExam"],
        stateSignature: json["stateSignature"],
      );
}
