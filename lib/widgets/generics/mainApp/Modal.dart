import 'package:GoClassUnibe/constants/Colors.dart';
import 'package:GoClassUnibe/constants/Fonts.dart';
import 'package:GoClassUnibe/widgets/generics/mainApp/CategoryText.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

void showModal(
    BuildContext context,
    String signatureName,
    String ap1,
    String ap2,
    String ap3,
    String finalRating1,
    String in1,
    String in2,
    String in3,
    String finalIn) {
  final TextStyle _textStyle1 =
      TextStyle(fontSize: 30, fontFamily: fontApp, color: colorAppTextLight);
  final TextStyle _subTextStyle1 = TextStyle(
      fontSize: 16,
      fontFamily: fontApp,
      color: colorAppTextLight,
      fontWeight: FontWeight.bold);
  final TextStyle _textStyleColor1 = TextStyle(
      fontSize: 30,
      fontFamily: fontApp,
      color: colorAppBlue,
      fontWeight: FontWeight.bold);
  final TextStyle _textStyleColor2 = TextStyle(
      fontSize: 30,
      fontFamily: fontApp,
      color: colorAppYellow,
      fontWeight: FontWeight.bold);
  final TextStyle _subTextStyleColor1 = TextStyle(
      fontSize: 16,
      fontFamily: fontApp,
      color: colorAppBlue,
      fontWeight: FontWeight.bold);
  final TextStyle _subTextStyleColor2 = TextStyle(
      fontSize: 16,
      fontFamily: fontApp,
      color: colorAppYellow,
      fontWeight: FontWeight.bold);

  showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: Text(
            signatureName,
            style: TextStyle(
                color: colorAppTextDark,
                fontFamily: fontApp,
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              CategoryText(
                title: "Calificación",
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Text(
                        ap1,
                        style: _textStyle1,
                      ),
                      Text(
                        "Aporte 1",
                        style: _subTextStyle1,
                      )
                    ],
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Column(
                    children: [
                      Text(
                        ap2,
                        style: _textStyle1,
                      ),
                      Text(
                        "Aporte 2",
                        style: _subTextStyle1,
                      )
                    ],
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Column(
                    children: [
                      Text(
                        ap3,
                        style: _textStyle1,
                      ),
                      Text(
                        "Aporte 3",
                        style: _subTextStyle1,
                      )
                    ],
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Column(
                    children: [
                      Text(
                        finalRating1,
                        style: _textStyleColor1,
                      ),
                      Text(
                        "Final",
                        style: _subTextStyleColor1,
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 24,
              ),
              CategoryText(
                title: "Inasistencias",
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Text(
                        in1,
                        style: _textStyle1,
                      ),
                      Text(
                        "Aporte 1",
                        style: _subTextStyle1,
                      )
                    ],
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Column(
                    children: [
                      Text(
                        in2,
                        style: _textStyle1,
                      ),
                      Text(
                        "Aporte 2",
                        style: _subTextStyle1,
                      )
                    ],
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Column(
                    children: [
                      Text(
                        in3,
                        style: _textStyle1,
                      ),
                      Text(
                        "Aporte 3",
                        style: _subTextStyle1,
                      )
                    ],
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Column(
                    children: [
                      Text(
                        finalIn,
                        style: _textStyleColor2,
                      ),
                      Text(
                        "Final",
                        style: _subTextStyleColor2,
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 24,
              ),
              CategoryText(
                title: "Estado",
              ),
              SizedBox(
                height: 16,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Ionicons.checkmark_circle,
                      color: colorAppGreen,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Text(
                      "Aprobado",
                      style: TextStyle(
                          color: colorAppTextLight,
                          fontFamily: fontApp,
                          fontSize: 18),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      });
}

void showModalAbsence(BuildContext context, String signatureName, String in1,
    String in2, String in3, String finalIn) {
  final TextStyle _textStyle1 =
      TextStyle(fontSize: 30, fontFamily: fontApp, color: colorAppTextLight);
  final TextStyle _subTextStyle1 = TextStyle(
      fontSize: 16,
      fontFamily: fontApp,
      color: colorAppTextLight,
      fontWeight: FontWeight.bold);
  final TextStyle _textStyleColor2 = TextStyle(
      fontSize: 30,
      fontFamily: fontApp,
      color: colorAppYellow,
      fontWeight: FontWeight.bold);
  final TextStyle _subTextStyleColor2 = TextStyle(
      fontSize: 16,
      fontFamily: fontApp,
      color: colorAppYellow,
      fontWeight: FontWeight.bold);

  showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: Text(
            signatureName,
            style: TextStyle(
                color: colorAppTextDark,
                fontFamily: fontApp,
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              CategoryText(
                title: "Inasistencias",
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Text(
                        in1,
                        style: _textStyle1,
                      ),
                      Text(
                        "Aporte 1",
                        style: _subTextStyle1,
                      )
                    ],
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Column(
                    children: [
                      Text(
                        in2,
                        style: _textStyle1,
                      ),
                      Text(
                        "Aporte 2",
                        style: _subTextStyle1,
                      )
                    ],
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Column(
                    children: [
                      Text(
                        in3,
                        style: _textStyle1,
                      ),
                      Text(
                        "Aporte 3",
                        style: _subTextStyle1,
                      )
                    ],
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Column(
                    children: [
                      Text(
                        finalIn,
                        style: _textStyleColor2,
                      ),
                      Text(
                        "Final",
                        style: _subTextStyleColor2,
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 24,
              ),
            ],
          ),
        );
      });
}
