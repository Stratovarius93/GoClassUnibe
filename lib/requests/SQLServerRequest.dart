import 'package:http/http.dart' as http;

class SQLServerRequest {
  String _studentID = '1234567890';

  //final url = 'http://10.0.2.2:8080/api/';
  final url = 'http://192.168.0.107:8080/api/';
  SQLServerRequest();

  Future<http.Response> fetchStudent() {
    return http.get(url + 'student/' + getStudentID);
  }

  Future<http.Response> fetchRating() {
    return http.get(url + 'ratings/' + getStudentID);
  }

  Future<http.Response> fetchPeriod() {
    return http.get(url + 'periods/' + getStudentID);
  }


  Future<http.Response> fetchRegistration() {
    return http.get(url + 'registration/' + getStudentID);
  }

  String get getStudentID => _studentID;
  set setStudentID(String studentID) {
    _studentID = studentID;
  }
}
