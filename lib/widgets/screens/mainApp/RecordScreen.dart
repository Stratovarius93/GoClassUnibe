import 'package:GoClassUnibe/constants/Shadows.dart';
import 'package:GoClassUnibe/constants/Fonts.dart';
import 'package:GoClassUnibe/constants/Title.dart';
import 'package:GoClassUnibe/services/serviceStudent.dart';
import 'package:GoClassUnibe/widgets/generics/mainApp/CategoryText.dart';
import 'package:GoClassUnibe/widgets/generics/mainApp/MainCard.dart';
import 'package:GoClassUnibe/widgets/generics/mainApp/Modal.dart';
import 'package:GoClassUnibe/widgets/screens/mainApp/RatingsScreen.dart';
import 'package:flutter/material.dart';
import 'package:GoClassUnibe/widgets/generics/mainApp/BigTitle.dart';

import 'package:GoClassUnibe/constants/Colors.dart';
import 'package:provider/provider.dart';
import 'package:scroll_glow_color/widget/scroll_glow_color.dart';

class RecordScreen extends StatefulWidget {
  @override
  _RecordScreenState createState() => _RecordScreenState();
}

class _RecordScreenState extends State<RecordScreen> {
  final double _pi = 3.1415926535897932;
  final list = List.generate(5, (i) => "Materia $i");
  @override
  Widget build(BuildContext context) {
    final studentData = Provider.of<StudentData>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: colorAppBackground,
        body: ScrollGlowColor(
          color: colorGlow,
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              Container(
                padding: EdgeInsets.only(
                    top: titlePaddingTop(context),
                    left: 16,
                    right: 16,
                    bottom: 0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BigTitle(
                        title: "Récord Académico",
                      ),
                      CategoryText(
                        title: studentData.getCareer,
                      )
                    ]),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: MainCard(
                  childCard: _listItems(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _listItems() {
    return ListView.separated(
      separatorBuilder: (context, index) => Divider(
        color: colorAppTextLight,
      ),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, i) => ExpansionTile(
        childrenPadding: EdgeInsets.all(0),
        leading: CircleAvatar(
          backgroundColor: constantsListColors[i],
          radius: (MediaQuery.of(context).size.width * 0.11) / 2,
          child: Transform.rotate(
            angle: -_pi / 10,
            child: Container(
              child: Text("P$i",
                  style: TextStyle(
                      fontSize: 30,
                      fontFamily: fontApp,
                      color: Colors.white.withOpacity(0.6),
                      fontWeight: FontWeight.bold)),
            ),
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            "Período $i",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: fontApp,
                color: colorAppTextDark),
          ),
        ),
        subtitle: Text(
          "$i de 5 materias matriculadas",
          style: TextStyle(
            fontFamily: fontApp,
            color: colorAppTextLight,
            fontSize: 16,
          ),
        ),
        children: list
            .map((val) => ListTile(
                  onTap: () {
                    showModal(context, val, "8.1", "8.2", "8.3", "8.3", "1",
                        "2", "3", "6");
                  },
                  title: Text(
                    val,
                    style: TextStyle(
                        color: colorAppTextLight,
                        fontSize: 18,
                        fontFamily: fontApp),
                  ),
                  trailing: Container(
                      padding:
                          EdgeInsets.only(top: 4, bottom: 4, left: 8, right: 8),
                      decoration: BoxDecoration(
                          color: colorAppGreen.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(16.0)),
                      child: Text("Aprobado",
                          style: TextStyle(
                              fontFamily: fontApp,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: colorAppGreen))),
                ))
            .toList(),
      ),
      itemCount: 5,
    );
  }
}
