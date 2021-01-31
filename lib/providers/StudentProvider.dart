import 'package:GoClassUnibe/models/StudentModel.dart';
import 'package:GoClassUnibe/preferences/userPreferences.dart';
import 'package:GoClassUnibe/requests/AuthFirebase.dart';
import 'package:GoClassUnibe/requests/SQLServerRequest.dart';
import 'package:flutter/material.dart';

class StudentProvider with ChangeNotifier {
  Student _student;
  bool connectionStatus = false;

  final _prefs = new UserPreferences();
  StudentProvider() {
    this.getStudentByID();
  }

  getStudentByID() async {
    try {
      final res = await AuthFirebaseRequest().fetchUrl();
      if (res) {
        try {
          final id = await _prefs.studentID;
          await SQLServerRequest().fetchStudent(id.toString()).then((res) {
            if (res.statusCode == 200) {
              final decodedData = studentFromJson(res.body);
              if (decodedData.length > 0) {
                if (decodedData.length == 1) {
                  List<Student> list = [];
                  list.addAll(decodedData);
                  this.setStudent(list[0]);
                  notifyListeners();
                } else {
                  List<Student> list = [];
                  list.addAll(decodedData);
                  this.setStudent(list[0]);
                  notifyListeners();
                }
                this.connectionStatus = true;
                print('SQL Server Connected');
              } else {
                print('There is no student with this ID');
              }
            } else {
              throw Exception('Failed to load data');
            }
          });
        } catch (e) {
          print('No internet connection');
          this.connectionStatus = false;
        }
      }
    } catch (e) {
      print(e);
    }
  }

  Student getStudent() => _student;
  setStudent(Student student) {
    this._student = student;
    notifyListeners();
  }
}
