import 'dart:convert';

List<EmailById> emailByIdFromJson(String str) =>
    List<EmailById>.from(json.decode(str).map((x) => EmailById.fromJson(x)));

String emailByIdToJson(List<EmailById> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EmailById {
  EmailById({
    this.email,
  });

  String email;

  factory EmailById.fromJson(Map<String, dynamic> json) => EmailById(
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
      };
}
