import 'dart:async';

import 'package:flutter_test/flutter_test.dart';

import 'providerTest/model/location.dart';
import 'providerTest/model/student.dart';

//import 'model/location.dart';

// Run generator -> flutter pub run build_runner build --delete-conflicting-outputs

// Run this test flutter test test/providers_test/provider_test.dart

void main() async {
  //

  Location _locationModel;

  StreamController<Location> _controller;

  setUp(() {
    _controller = StreamController<Location>();
    _locationModel = Location(city: 'London');
  });

  Student _studentModel;

  StreamController<Student> _studentController;

  setUp(() {
    _studentController = StreamController<Student>();
    _studentModel = Student(name: 'Juan');
  });

  group('[Location Model]', () {
    //

    test('[Model] Check individual values', () async {
      _locationModel = Location(
        city: 'London',
        countryName: 'England',
        country: 'England',
        currency: 'GBP',
        ip: '',
        inEu: true,
        languages: 'EN',
      );

      // BEGIN TESTS....
      expect(_locationModel.city, 'London');

      expect(_locationModel.countryName.runtimeType, equals(String));

      expect(_locationModel.country, isNotNull);

      expect(_locationModel.ip, isEmpty);

      expect(_locationModel.inEu, isTrue);

      expect(_locationModel.languages, contains('EN'));

      expect(_locationModel.currency, startsWith('G'));

      expect(_locationModel.country, matches('England'));
    });

    test('[Model] Check individual values', () async {
      _studentModel = Student(
        name: 'Juan',
        lastName: 'Perez',
        career: 'Gastronomia',
        studentId: 1234567890
      );

      // BEGIN TESTS....
      expect(_studentModel.name, 'Juan');
    });
  });
}
