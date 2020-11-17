import 'package:flutter/material.dart';
import 'package:GoClassUnibe/constants/Shadows.dart';

class MainCard extends StatelessWidget {
  final Widget childCard;
  const MainCard({Key key, this.childCard}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: Colors.white,
          boxShadow: <BoxShadow>[boxShadowApp]),
      child: childCard,
    );
  }
}
