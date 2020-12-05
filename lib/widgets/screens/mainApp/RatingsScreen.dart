import 'package:GoClassUnibe/constants/Shadows.dart';
import 'package:GoClassUnibe/constants/Title.dart';
import 'package:GoClassUnibe/services/serviceStudent.dart';
import 'package:GoClassUnibe/widgets/generics/mainApp/CategoryText.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:GoClassUnibe/widgets/generics/mainApp/BigTitle.dart';

import 'package:GoClassUnibe/constants/Fonts.dart';
import 'package:GoClassUnibe/constants/Colors.dart';
import 'package:provider/provider.dart';
import 'package:scroll_glow_color/widget/scroll_glow_color.dart';

class RatingsScreen extends StatefulWidget {
  @override
  _RatingsScreenState createState() => _RatingsScreenState();
}

class _RatingsScreenState extends State<RatingsScreen> {
  final double _pi = 3.1415926535897932;
  final list = List.generate(5, (i) => "Período $i");

  final list2 = List.generate(5, (i) => "Materia $i");

  @override
  Widget build(BuildContext context) {
    final studentData = Provider.of<StudentData>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: colorAppBackground,
        body: ScrollGlowColor(
          color: colorGlow,
          child: ListView(children: [
            Container(
                padding: EdgeInsets.only(
                    top: titlePaddingTop(context),
                    left: 16,
                    right: 16,
                    bottom: 16),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BigTitle(
                        title: "Calificaciones",
                      ),
                      CategoryText(
                        title: studentData.getCareer,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      _ratingsCard1(),
                      SizedBox(
                        height: 16,
                      ),
                      CategoryText(
                        title: "IDIOMAS",
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      _ratingsCard1(),
                    ])),
          ]),
        ),
      ),
    );
  }

  Widget _ratingsCard1() {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: <BoxShadow>[boxShadowApp]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: ListView.separated(
          separatorBuilder: (context, index) => Divider(
            color: colorAppTextLight,
          ),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: list.length,
          itemBuilder: (context, index) => Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: ExpansionTile(
              //trailing: Text("hola"),
              title: Text(
                '${list[index]}',
                style: TextStyle(
                    color: colorAppTextDark,
                    fontFamily: fontApp,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AutoSizeText(
                    "30/08/2020 -- 28/02/2021",
                    presetFontSizes: [13, 12, 11, 10, 8, 6, 4],
                    maxLines: 2,
                    style: TextStyle(
                      color: colorAppTextLight,
                      fontFamily: fontApp,
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.only(top: 6, bottom: 6, left: 10, right: 10),
                    decoration: BoxDecoration(
                        color: Colors.green.shade100,
                        borderRadius: BorderRadius.circular(16)),
                    child: AutoSizeText(
                      "8.5",
                      presetFontSizes: [16, 15, 14, 13, 12, 11, 10, 8, 6, 4],
                      style: TextStyle(
                          color: Colors.green.shade800, fontFamily: fontApp),
                    ),
                  )
                ],
              ),
              children: list2.map((val2) {
                var subIndex = list2.indexOf(val2);
                return ListTile(
                  onTap: () {
                    print(list[index]);
                  },
                  title: Text(
                    val2,
                    style: TextStyle(
                        color: colorAppTextDark,
                        fontFamily: fontApp,
                        fontSize: 18),
                  ),
                  leading: CircleAvatar(
                    backgroundColor: constantsListColors[subIndex],
                    radius: (MediaQuery.of(context).size.width * 0.11) / 2,
                    child: Transform.rotate(
                      angle: -_pi / 10,
                      child: Container(
                        child: Text(val2[0],
                            style: TextStyle(
                                fontSize: 30,
                                fontFamily: fontApp,
                                color: Colors.white.withOpacity(0.6),
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                  trailing: Container(
                    padding:
                        EdgeInsets.only(top: 6, bottom: 6, left: 10, right: 10),
                    decoration: BoxDecoration(
                        color: Colors.green.shade100,
                        borderRadius: BorderRadius.circular(16)),
                    child: Text(
                      "8.5",
                      style: TextStyle(
                          color: Colors.green.shade800,
                          fontSize: 18,
                          fontFamily: fontApp),
                    ),
                  ),
                  subtitle: Text(
                    "Aprobado",
                    style: TextStyle(
                        color: colorAppTextLight,
                        fontFamily: fontApp,
                        fontSize: 14),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
