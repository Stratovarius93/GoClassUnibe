import 'package:GoClassUnibe/constants/Title.dart';
import 'package:GoClassUnibe/widgets/generics/mainApp/CategoryText.dart';
import 'package:GoClassUnibe/widgets/generics/mainApp/MainCard2.dart';
import 'package:GoClassUnibe/widgets/generics/mainApp/Modal.dart';
import 'package:flutter/material.dart';
import 'package:GoClassUnibe/widgets/generics/mainApp/BigTitle.dart';
import 'package:GoClassUnibe/constants/Colors.dart';
import 'package:GoClassUnibe/constants/Fonts.dart';
import 'package:GoClassUnibe/widgets/generics/mainApp/Card1Dashboard.dart';
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

  List<Rating> rating = [
    Rating("Matematicas", "8.1", "8.2", "8.3", "8.2"),
    Rating("Matematicas", "8.1", "8.2", "8.3", "8.2"),
    Rating("Matematicas", "8.1", "8.2", "8.3", "8.2"),
    Rating("Matematicas", "8.1", "8.2", "8.3", "8.2"),
  ];
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
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _titleHeader(studentData.getName, studentData.getLastName,
                        studentData.getCareer),
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
                child: CategoryText(title: "Calificaciones"),
              ),
              _careerOption(),
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
      ),
    );
  }

  Widget _careerOption() {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 16.0, bottom: 16.0, left: 16.0, right: 8),
            child: RaisedButton(
              color: colorAppBlue.withOpacity(0.75),
              highlightColor: Colors.grey.shade300,
              highlightElevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              onPressed: () {
                showModalRatings();
              },
              elevation: 0,
              child: Container(
                height: 60,
                child: Row(
                  children: [
                    Icon(
                      Icons.school,
                      color: colorAppYellow,
                      size: 42,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Text(
                      "Ingenieria de Software",
                      style: TextStyle(
                          fontFamily: fontApp,
                          fontSize: 18,
                          color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 16.0, bottom: 16.0, left: 8.0, right: 16.0),
            child: RaisedButton(
              color: colorAppBlue.withOpacity(0.75),
              highlightColor: Colors.grey.shade300,
              highlightElevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              onPressed: () {},
              elevation: 0,
              child: Container(
                height: 60,
                child: Row(
                  children: [
                    Icon(
                      Icons.language,
                      color: colorAppYellow,
                      size: 42,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Text(
                      "Idiomas",
                      style: TextStyle(
                          fontFamily: fontApp,
                          fontSize: 18,
                          color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _signaturesItem(String signature, String absence, Color color) {
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

  Widget _titleHeader(String name, String lastName, String career) {
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

  void showModalRatings() {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        builder: (context) {
          return Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16))),
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: rating.length,
              itemBuilder: (context, index) {
                return _ratingsItem(
                  rating[index].signature,
                  rating[index].ap1,
                  rating[index].ap2,
                  rating[index].ap3,
                  rating[index].finalRating,
                );
              },
            ),
          );
        });
  }

  Widget _ratingsItem(String signature, String ap1, String ap2, String ap3,
      String finalRating) {
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
    final TextStyle _subTextStyleColor1 = TextStyle(
        fontSize: 16,
        fontFamily: fontApp,
        color: colorAppBlue,
        fontWeight: FontWeight.bold);

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            signature,
            style: TextStyle(
                color: colorAppTextDark,
                fontSize: 24,
                fontFamily: fontApp,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 16,
          ),
          CategoryText(
            title: "Calificaciones",
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
                    finalRating,
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
          )
        ],
      ),
    );
  }
}

class Absence {
  String signature, absence;

  Absence(this.signature, this.absence);
}

class Rating {
  String signature, ap1, ap2, ap3, finalRating;
  Rating(this.signature, this.ap1, this.ap2, this.ap3, this.finalRating);
}
