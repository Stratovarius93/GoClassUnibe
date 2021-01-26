import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static final UserPreferences _instance = new UserPreferences._internal();
  factory UserPreferences() {
    return _instance;
  }

  UserPreferences._internal();

  SharedPreferences _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  // GET && SET TOKEN
  get token {
    return _prefs.getString('token') ?? '';
  }

  set token(String value) {
    _prefs.setString('token', value);
  }

// GET && SET STUDENTID
  get studentID {
    return _prefs.getInt('studentID') ?? 0;
  }

  set studentID(int value) {
    _prefs.setInt('studentID', value);
  }

  get studentEmail {
    return _prefs.getString('email') ?? '';
  }

  set studentEmail(String value) {
    _prefs.setString('email', value);
  }

}
