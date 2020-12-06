import 'package:GoClassUnibe/constants/Title.dart';
import 'package:GoClassUnibe/services/serviceStudent.dart';
import 'package:GoClassUnibe/widgets/generics/mainApp/CategoryText.dart';
import 'package:GoClassUnibe/widgets/generics/mainApp/MainCard.dart';
import 'package:GoClassUnibe/widgets/generics/mainApp/MainCard2.dart';
import 'package:GoClassUnibe/widgets/generics/mainApp/Modal.dart';
import 'package:GoClassUnibe/widgets/screens/mainApp/RecordScreen.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:GoClassUnibe/widgets/generics/mainApp/BigTitle.dart';

import 'package:GoClassUnibe/constants/Fonts.dart';
import 'package:GoClassUnibe/constants/Colors.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:scroll_glow_color/widget/scroll_glow_color.dart';

class RatingsScreen extends StatefulWidget {
  @override
  _RatingsScreenState createState() => _RatingsScreenState();
}

class _RatingsScreenState extends State<RatingsScreen> {
  final double _pi = 3.1415926535897932;

  final list2 = List.generate(7, (i) => "Materia $i");

  PageController _pageController = new PageController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: colorAppBackground,
        body: PageView(
          controller: _pageController,
          physics: BouncingScrollPhysics(),
          children: [
            _ratingsPage1(context),
            _ratingsPage2(),
          ],
        ),
      ),
    );
  }

  Widget _ratingsPage1(BuildContext context) {
    final _studentData1 = Provider.of<StudentData>(context);
    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        Container(
          padding: EdgeInsets.only(
              top: titlePaddingTop(context), left: 16, right: 16, bottom: 0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            BigTitle(
              title: "Calificaciones",
            ),
            CategoryText(title: _studentData1.getCareer),
            SizedBox(
              height: 16,
            ),
            _signaturesList(),
            SizedBox(
              height: 16,
            ),
            CategoryText(
              title: "Idiomas",
            ),
            SizedBox(
              height: 16,
            ),
            _signaturesList(),
            SizedBox(
              height: 32,
            ),
            _bottonToRecordScreen(),
            SizedBox(
              height: 32,
            )
          ]),
        ),
      ],
    );
  }

  Widget _ratingsPage2() {
    return RecordScreen();
  }

  Widget _signaturesList() {
    return MainCard(
      childCard: ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              print(list2[index]);
              showModal(context, list2[index], "8.1", "8.2", "8.3", "8.3", "1",
                  "2", "3", "6");
            },
            child: Container(
              child: Row(children: [
                CircleAvatar(
                  backgroundColor: constantsListColors[index],
                  radius: (MediaQuery.of(context).size.width * 0.11) / 2,
                  child: Transform.rotate(
                    angle: -_pi / 10,
                    child: Container(
                      child: Text(list2[index][0],
                          style: TextStyle(
                              fontSize: 30,
                              fontFamily: fontApp,
                              color: Colors.white.withOpacity(0.6),
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      list2[index],
                      style: TextStyle(
                          fontFamily: fontApp,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: colorAppTextDark),
                    ),
                    Text(
                      "Aprobado",
                      style: TextStyle(
                          fontFamily: fontApp,
                          fontSize: 16,
                          color: colorAppTextLight),
                    )
                  ],
                )),
                SizedBox(
                  width: 16,
                ),
                Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: colorAppGreen.withOpacity(0.2),
                    ),
                    child: Text(
                      '8.5',
                      style: TextStyle(
                          color: colorAppGreen,
                          fontFamily: fontApp,
                          fontSize: 18),
                    )),
              ]),
            ),
          );
        },
        itemCount: list2.length,
        separatorBuilder: (context, index) => Divider(
          color: colorAppTextLight.withOpacity(0.5),
        ),
      ),
    );
  }

  Widget _bottonToRecordScreen() {
    return Container(
      child: Center(
        child: InkWell(
            onTap: () {
              _pageController.animateToPage(1,
                  duration: Duration(milliseconds: 500), curve: Curves.easeOut);
            },
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                "Ver Récord académico",
                style: TextStyle(
                    color: colorAppGreen,
                    fontFamily: fontApp,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              Icon(
                Ionicons.arrow_forward_outline,
                color: colorAppGreen,
              )
            ])),
      ),
    );
  }
}
