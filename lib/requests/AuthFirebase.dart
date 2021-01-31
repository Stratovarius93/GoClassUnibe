import 'dart:convert';

import 'package:GoClassUnibe/preferences/userPreferences.dart';
import 'package:GoClassUnibe/requests/SQLServerRequest.dart';
import 'package:http/http.dart' as http;

class AuthFirebaseRequest {
  final String _ApiKey = 'AIzaSyALbLpj4h6D1Wi-suhHNxI1FvN-Ogne1Qs';

  Future<Map<String, dynamic>> fetchLogin(String email, String password) async {
    final _prefs = new UserPreferences();
    //final _sqlServerRequests = SQLServerRequest();
    final authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };
    final res = await http.post(
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$_ApiKey',
        body: json.encode(authData));
    Map<String, dynamic> decodeRes = json.decode(res.body);
    print(decodeRes);
    if (decodeRes.containsKey('idToken')) {
      _prefs.token = decodeRes['idToken'];
      //_prefs.studentID =
      return {'ok': true, 'token': decodeRes['idToken']};
    } else {
      return {'ok': false, 'message': decodeRes['error']['message']};
    }
  }

  Future<Map<String, dynamic>> fetchSignUp(
      String email, String password) async {
    final _prefs = new UserPreferences();
    final authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };
    final res = await http.post(
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$_ApiKey',
        body: json.encode(authData));
    Map<String, dynamic> decodeRes = json.decode(res.body);
    print(decodeRes);
    if (decodeRes.containsKey('idToken')) {
      _prefs.token = decodeRes['idToken'];
      _prefs.studentEmail = email;
      return {'ok': true, 'token': decodeRes['idToken']};
    } else {
      return {'ok': false, 'message': decodeRes['error']['message']};
    }
  }

  Future<Map<String, dynamic>> fetchResetPassword(String email) async {
    final _passData = {
      'requestType': "PASSWORD_RESET",
      'email': email,
    };
    final res = await http.post(
        'https://identitytoolkit.googleapis.com/v1/accounts:sendOobCode?key=$_ApiKey',
        body: json.encode(_passData));
    Map<String, dynamic> decodeRes = json.decode(res.body);
    if (decodeRes.containsKey('email')) {
      return {'ok': true, 'email': decodeRes['email']};
    } else {
      return {'ok': false, 'message': decodeRes['error']['message']};
    }
  }

  Future<bool> fetchChangeEmail(String email) async {
    final _prefs = new UserPreferences();
    final _authData = {
      'idToken': _prefs.token,
      'email': email,
      'returnSecureToken': true
    };
    final res = await http.post(
        'https://identitytoolkit.googleapis.com/v1/accounts:update?key=$_ApiKey',
        body: json.encode(_authData));
    Map<String, dynamic> decodeRes = json.decode(res.body);
    if (decodeRes.containsKey('email')) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> fetchUrl() async {
    final _prefs = new UserPreferences();
    String url = 'https://testlogin-10b84-default-rtdb.firebaseio.com/url.json';
    try {
      final res = await http.get(url);
      final decodeRes = json.decode(res.body);
      String decodeRes2 = decodeRes;
      if (decodeRes2.length > 0) {
        _prefs.url = decodeRes2;
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
