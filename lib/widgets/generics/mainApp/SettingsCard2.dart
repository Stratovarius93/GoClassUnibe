import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:GoClassUnibe/widgets/generics/mainApp/MainCard.dart';
import 'package:GoClassUnibe/widgets/generics/mainApp/ListToCard.dart';

class SettingsCard2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MainCard(
        childCard: Container(
      width: MediaQuery.of(context).size.width - 32,
      //height: MediaQuery.of(context).size.height,
      child: ListToCard(),
    ));
  }
}
