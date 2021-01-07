import 'dart:convert';

List<Period> periodFromJson(String str) => List<Period>.from(json.decode(str).map((x) => Period.fromJson(x)));

String periodToJson(List<Period> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Period {
    Period({
        this.periodId,
        this.cycle,
        this.careerId,
    });

    int periodId;
    String cycle;
    int careerId;

    factory Period.fromJson(Map<String, dynamic> json) => Period(
        periodId: json["periodID"],
        cycle: json["cycle"],
        careerId: json["careerID"],
    );

    Map<String, dynamic> toJson() => {
        "periodID": periodId,
        "cycle": cycle,
        "careerID": careerId,
    };
}
