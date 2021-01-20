import 'package:GoClassUnibe/constants/Colors.dart';
import 'package:GoClassUnibe/constants/Fonts.dart';
import 'package:flutter/material.dart';

class LoadingCircle extends StatelessWidget {
  final String loadingText;

  const LoadingCircle({Key key, this.loadingText}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(colorAppSkyBlue),
          ),
          SizedBox(height: 16,),
          Text(
            loadingText,
            style: TextStyle(
                fontFamily: fontApp, color: colorAppSkyBlue, fontSize: 16),
          )
        ],
      ),
    );
  }
}
