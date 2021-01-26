import 'package:GoClassUnibe/constants/Colors.dart';
import 'package:flutter/material.dart';

class LoadingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(colorAppSkyBlue),
          ),
        ],
      ),
    );
  }
}
