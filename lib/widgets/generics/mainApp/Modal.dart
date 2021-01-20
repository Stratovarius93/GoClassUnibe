import 'package:GoClassUnibe/constants/Colors.dart';
import 'package:GoClassUnibe/constants/Fonts.dart';
import 'package:GoClassUnibe/constants/UtilsText.dart';
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
    String finalIn,
    String stateSignature) {
  final TextStyle _textStyle1 =
      TextStyle(fontSize: 28, fontFamily: fontApp, color: colorAppTextLight);
  final TextStyle _subTextStyle1 = TextStyle(
      fontSize: 14,
      fontFamily: fontApp,
      color: colorAppTextLight,
      fontWeight: FontWeight.bold);
  final TextStyle _textStyleColor1 = TextStyle(
      fontSize: 30,
      fontFamily: fontApp,
      color: colorAppBlue,
      fontWeight: FontWeight.bold);

  final TextStyle _subTextStyleColor1 = TextStyle(
      fontSize: 16,
      fontFamily: fontApp,
      color: colorAppBlue,
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(6),
                    margin: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.blueGrey.shade100.withOpacity(0.3)),
                    child: Column(
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
                  ),
                  Container(
                    padding: EdgeInsets.all(6),
                    margin: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.blueGrey.shade100.withOpacity(0.3)),
                    child: Column(
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
                  ),
                  Container(
                    padding: EdgeInsets.all(6),
                    margin: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.blueGrey.shade100.withOpacity(0.3)),
                    child: Column(
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
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: constantsListColors[2].withOpacity(0.5),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        finalRating1,
                        style: _textStyleColor1,
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Text(
                        "Nota final",
                        style: _subTextStyleColor1,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              CategoryText(
                title: "Inasistencias",
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(6),
                    margin: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.blueGrey.shade100.withOpacity(0.3)),
                    child: Column(
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
                  ),
                  Container(
                    padding: EdgeInsets.all(6),
                    margin: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.blueGrey.shade100.withOpacity(0.3)),
                    child: Column(
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
                  ),
                  Container(
                    padding: EdgeInsets.all(6),
                    margin: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.blueGrey.shade100.withOpacity(0.3)),
                    child: Column(
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
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: constantsListColors[2].withOpacity(0.5),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        finalIn,
                        style: _textStyleColor1,
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Text(
                        "Inasistencias",
                        style: _subTextStyleColor1,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 16,
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
                      _statusSignatureIcon(stateSignature),
                      color: stateSignatureText(stateSignature),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Text(
                      toSentence(stateSignature),
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
      TextStyle(fontSize: 28, fontFamily: fontApp, color: Colors.blueGrey);
  final TextStyle _subTextStyle1 = TextStyle(
      fontSize: 14,
      fontFamily: fontApp,
      color: Colors.blueGrey.withOpacity(0.6),
      fontWeight: FontWeight.w800);
  final TextStyle _textStyleColor2 = TextStyle(
      fontSize: 30,
      fontFamily: fontApp,
      color: colorAppBlue,
      fontWeight: FontWeight.bold);
  final TextStyle _subTextStyleColor2 = TextStyle(
      fontSize: 16,
      fontFamily: fontApp,
      color: colorAppBlue,
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(6),
                    margin: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.blueGrey.shade100.withOpacity(0.3)),
                    child: Column(
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
                  ),
                  Container(
                    padding: EdgeInsets.all(6),
                    margin: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.blueGrey.shade100.withOpacity(0.3)),
                    child: Column(
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
                  ),
                  Container(
                    padding: EdgeInsets.all(6),
                    margin: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.blueGrey.shade100.withOpacity(0.3)),
                    child: Column(
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
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              CategoryText(
                title: 'Total',
              ),
              SizedBox(
                height: 16,
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      color: colorAppBlue.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: constantsListColors[2],
                        child: Text(
                          finalIn,
                          style: _textStyleColor2,
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Text(
                        "Inasistencias",
                        style: _subTextStyleColor2,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 24,
              ),
            ],
          ),
        );
      });
}
IconData _statusSignatureIcon(String stateSignature){
  if (stateSignature == 'APROBADO') {
    return Ionicons.checkmark_circle;
  } else if (stateSignature == 'REPROBADO') {
    return Ionicons.close_circle;
  } else {
    return Ionicons.alert_circle;
  }

}
