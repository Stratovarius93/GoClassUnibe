import 'dart:convert';

import 'package:GoClassUnibe/models/EmailModel.dart';
import 'package:GoClassUnibe/models/StudentModel.dart';
import 'package:GoClassUnibe/models/StudentModelToDB.dart';
import 'package:GoClassUnibe/preferences/userPreferences.dart';
import 'package:http/http.dart' as http;

class SQLServerRequest {
  //int _studentID = 1234567890;

  //final url = 'http://10.0.2.2:8080/api/';
  //final url = 'http://192.168.0.107:8080/api/';
  //final url = 'https://warm-dragon-17.loca.lt/api/';
  SQLServerRequest();

  Future<http.Response> fetchStudent(String studentID) {
    final _prefs = new UserPreferences();
    return http.get(_prefs.url + 'student/' + studentID);
  }

  Future<http.Response> fetchRating(String studentID) {
    final _prefs = new UserPreferences();
    return http.get(_prefs.url + 'ratings/' + studentID);
  }

  Future<http.Response> fetchPeriod(String studentID) {
    final _prefs = new UserPreferences();
    return http.get(_prefs.url + 'periods/' + studentID);
  }

  Future<http.Response> fetchRegistration(String studentID) {
    final _prefs = new UserPreferences();
    return http.get(_prefs.url + 'registration/' + studentID);
  }

  //int get getStudentID => _studentID;
  //set setStudentID(int studentID) {
  //_studentID = studentID;
  //}

  Future<Student> fetchStudentID(int studentID) {
    final _prefs = new UserPreferences();
    return http.get(_prefs.url + 'student/' + studentID.toString()).then((res) {
      if (res.statusCode == 200) {
        final decodedData = studentFromJson(res.body);
        if (decodedData.length > 0) {
          Student student = decodedData[0];
          return student;
        }
        return null;
      } else {
        print('Error de conexion');
        return null;
      }
    });
  }

  // ==============================
  // POST ACCOUNTS SQL SERVER
  // ==============================

  Future<bool> addAccount(StudentToDb studentToDb) async {
    final _prefs = new UserPreferences();
    try {
      http.Response res = await http.post(
        _prefs.url + 'account',
        body: studentToDbToJson(studentToDb),
        headers: {
          "Content-Type": "application/json; charset=utf-8",
        },
      );
      print(res.body);
      _prefs.studentID = studentToDb.studentId;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<String> getEmailByID(int studentId) async {
    final _prefs = new UserPreferences();
    String resEmail = '';
    await http.get(_prefs.url + 'account/$studentId').then((res) {
      if (res.statusCode == 200) {
        final decodedData = emailByIdFromJson(res.body);
        if (decodedData.length > 0) {
          resEmail = decodedData[0].email;
        } else {
          resEmail = '';
        }
      } else {
        //throw Exception('Failed to load data');
        resEmail = 'Failed to load data';
      }
    });
    return resEmail;
  }

  Future<bool> updateEmailByID(int studentId, String email) async {
    final _prefs = new UserPreferences();
    final _data = {"email": email};
    final res = await http.put(
      _prefs.url + 'account/update/$studentId',
      body: json.encode(_data),
      headers: {
        "Content-Type": "application/json; charset=utf-8",
      },
    );
    if (res.statusCode == 200) {
      final decodedData = json.decode(res.body);
      final containsKeyBool = decodedData[0].containsKey('email');
      return containsKeyBool;
    } else {
      return false;
    }
  }

  Future<bool> getState(int studentID) async {
    final _prefs = new UserPreferences();
    try {
      final res =
          await http.get(_prefs.url + 'student/' + studentID.toString());
      final decodeData = json.decode(res.body);
      print(decodeData);
      return true;
    } catch (e) {
      return false;
    }
  }
}
