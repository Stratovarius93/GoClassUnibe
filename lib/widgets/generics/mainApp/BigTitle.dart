import 'package:flutter/material.dart';
import 'package:GoClassUnibe/constants/Fonts.dart';
import 'package:GoClassUnibe/constants/Colors.dart';
import 'package:flutter/rendering.dart';
import 'package:auto_size_text/auto_size_text.dart';

class BigTitle extends StatelessWidget {
  final String title;
  const BigTitle({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        //color: Colors.indigo,
        width: MediaQuery.of(context).size.width * 0.6,
        height: 60,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AutoSizeText(
              title,
              style: TextStyle(
                  fontFamily: fontApp,
                  color: colorAppTextDark,
                  fontWeight: FontWeight.w900),
              presetFontSizes: [35, 32, 30, 28, 26, 24, 22, 20],
              maxLines: 1,
            )
          ],
        ));
  }
}
