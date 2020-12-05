import 'package:flutter/material.dart';

class MainCard2 extends StatelessWidget {
  final Widget childCard;
  const MainCard2({Key key, this.childCard}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: Colors.white,
      ),
      child: childCard,
    );
  }
}
