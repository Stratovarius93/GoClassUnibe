import 'package:GoClassUnibe/models/StudentModel.dart';
import 'package:GoClassUnibe/requests/SQLServerRequest.dart';
import 'package:flutter/material.dart';

class StudentProvider with ChangeNotifier {
  Student _student;
  StudentProvider() {
    this.getStudentByID();
  }

  getStudentByID() async {
    await SQLServerRequest().fetchStudent().then((res) {
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
        } else {
          print('There is no student with this ID');
        }
      } else {
        throw Exception('Failed to load data');
      }
    });
  }

  Student getStudent() => _student;
  setStudent(Student student) {
    this._student = student;
    notifyListeners();
  }
}
