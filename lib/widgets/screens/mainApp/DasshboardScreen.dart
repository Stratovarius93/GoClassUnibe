import 'package:GoClassUnibe/constants/Title.dart';
import 'package:GoClassUnibe/widgets/generics/mainApp/CategoryText.dart';
import 'package:GoClassUnibe/widgets/generics/mainApp/MainCard2.dart';
import 'package:GoClassUnibe/widgets/generics/mainApp/Modal.dart';
import 'package:flutter/material.dart';
import 'package:GoClassUnibe/widgets/generics/mainApp/BigTitle.dart';
import 'package:GoClassUnibe/constants/Colors.dart';
import 'package:GoClassUnibe/constants/Fonts.dart';
import 'package:GoClassUnibe/widgets/generics/mainApp/Card1Dashboard.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:GoClassUnibe/services/serviceStudent.dart';
import 'package:scroll_glow_color/scroll_glow_color.dart';

class DasshboardScreen extends StatefulWidget {
  @override
  _DasshboardScreenState createState() => _DasshboardScreenState();
}

class _DasshboardScreenState extends State<DasshboardScreen> {
  List<Absence> absence = [
    Absence('Matematicas', '10 inasistencias'),
    Absence('Matematicas', '20 inasistencias'),
    Absence('Matematicas', '30 inasistencias'),
    Absence('Matematicas', '40 inasistencias'),
  ];

  @override
  Widget build(BuildContext context) {
    final studentData = Provider.of<StudentData>(context);
    return Scaffold(
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
                mainAxisSize: MainAxisSize.min,
                children: [
                  _titleHeader(context, studentData.getName,
                      studentData.getLastName, studentData.getCareer),
                  SizedBox(
                    height: 16,
                  ),
                  CategoryText(title: "Clase de hoy"),
                ],
              ),
            ),
            SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 20.0, bottom: 20.0, left: 16.0, right: 8.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: InkWell(
                        onTap: () {
                          showModal(context, "Matetmaticas", "8.1", "8.2",
                              "8.3", "8.3", "1", "2", "3", "6");
                        },
                        child: Card1Dashboard(
                          subject: "Matetmaticas",
                          teacherName: "Dra. Yoisi Perez",
                          subjectTime: "7:00 - 9:00 AM",
                          classRoom: "Aula A1",
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Card1Dashboard(
                        subject: "Matetmaticas",
                        teacherName: "Dra. Yoisi Perez",
                        subjectTime: "7:00 - 9:00 AM",
                        classRoom: "Aula A1",
                      ),
                    ),
                  ),
                ])),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: CategoryText(title: "Inasistencias del último período"),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: MainCard2(
                childCard: ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: absence.length,
                    separatorBuilder: (context, index) => Divider(
                          color: colorAppTextLight.withOpacity(0.5),
                        ),
                    itemBuilder: (context, index) {
                      return _signaturesItem(
                          context,
                          "${absence[index].signature}",
                          "${absence[index].absence}",
                          constantsListColors[index]);
                      //return Text(absence[index].absence);
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _signaturesItem(
      BuildContext context, String signature, String absence, Color color) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: color,
          child: Text(signature[0],
              style: TextStyle(
                color: Colors.white,
                fontFamily: fontApp,
                fontSize: 20,
              )),
        ),
        SizedBox(
          width: 16,
        ),
        Expanded(
          child: InkWell(
            onTap: () {
              showModalAbsence(context, signature, "1", "2", "3", "6");
              //Navigator.push(context, MaterialPageRoute(builder: (context)=>OnlyRatingsScreen());
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  signature,
                  style: TextStyle(
                    fontSize: 18,
                    color: colorAppTextDark,
                    fontFamily: fontApp,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  absence,
                  style: TextStyle(
                    fontFamily: fontApp,
                    color: colorAppTextLight,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _titleHeader(
      BuildContext context, String name, String lastName, String career) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BigTitle(
              title: "Hola, " + name,
            ),
            Text(
              career,
              style: TextStyle(
                  fontFamily: fontApp, color: colorAppTextLight, fontSize: 18),
            )
          ],
        ),
        CircleAvatar(
          backgroundColor: colorAppSkyBlue,
          radius: (MediaQuery.of(context).size.width * 0.15) / 2,
          child: Text(
            name[0] + lastName[0],
            style: TextStyle(
              color: Colors.white,
              fontFamily: fontApp,
              fontSize: 32,
            ),
          ),
        )
      ],
    );
  }
}

class Absence {
  String signature, absence;

  Absence(this.signature, this.absence);
}
