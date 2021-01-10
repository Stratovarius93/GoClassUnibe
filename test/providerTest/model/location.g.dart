// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Location _$LocationFromJson(Map<String, dynamic> json) {
  return Location(
    city: json['city'] as String,
    country: json['country'] as String,
    countryName: json['country_name'] as String,
    currency: json['currency'] as String,
    inEu: json['in_eu'] as bool,
    ip: json['ip'] as String,
    languages: json['languages'] as String,
  );
}

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'city': instance.city,
      'country': instance.country,
      'country_name': instance.countryName,
      'currency': instance.currency,
      'in_eu': instance.inEu,
      'ip': instance.ip,
      'languages': instance.languages,
    };
