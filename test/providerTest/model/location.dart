import 'package:json_annotation/json_annotation.dart';

/// This allows the `Location` class to access private members in
/// the generated file.
part 'location.g.dart';

@JsonSerializable()
class Location {
  //

  Location({
    this.city,
    this.country,
    this.countryName,
    this.currency,
    this.inEu,
    this.ip,
    this.languages,
  });

  @JsonKey(name: 'city')
  String city;

  @JsonKey(name: 'country')
  String country;

  @JsonKey(name: 'country_name')
  String countryName;

  @JsonKey(name: 'currency')
  String currency;

  @JsonKey(name: 'in_eu')
  bool inEu;

  @JsonKey(name: 'ip')
  String ip;

  @JsonKey(name: 'languages')
  String languages;

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}