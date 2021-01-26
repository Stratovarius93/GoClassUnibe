import 'package:GoClassUnibe/models/RatingsModel.dart';
import 'package:GoClassUnibe/preferences/userPreferences.dart';
import 'package:GoClassUnibe/requests/SQLServerRequest.dart';
import 'package:flutter/material.dart';

class RatingProvider with ChangeNotifier {
  List<Rating> _ratings = [];
  final _prefs = new UserPreferences();
  RatingProvider() {
    this.getRatingsByID();
  }

  getRatingsByID() async {
    try {
      final id = await _prefs.studentID;
      await SQLServerRequest().fetchRating(id.toString()).then((res) {
        if (res.statusCode == 200) {
          final decodeData = ratingFromJson(res.body);
          if (decodeData.length > 0) {
            List<Rating> list = [];
            list.addAll(decodeData);
            this.setRatings(list);
            notifyListeners();
          }
        }
      });
    } catch (e) {
      print('No internet connection');
    }
  }

  List<Rating> getRatings() => _ratings;

  setRatings(List<Rating> ratings) {
    _ratings = ratings;
    notifyListeners();
  }
}
