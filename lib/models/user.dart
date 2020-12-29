import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class User with ChangeNotifier {
  String id;
  String displayName;
  String email;

  User({this.id, this.displayName, this.email});

  factory User.fromFirestore(DocumentSnapshot userDoc) {
    Map userData = userDoc.data;
    return User(
      id: userDoc.documentID,
      displayName: userData['displayName'],
      email: userData['email'],
    );
  }

  void setFromFireStore(DocumentSnapshot userDoc) {
    Map userData = userDoc.data;
    this.id = userDoc.documentID;
    this.displayName = userData['displayName'];
    this.email = userData['email'];
    notifyListeners();
  }
}
