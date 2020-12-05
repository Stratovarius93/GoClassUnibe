import 'package:GoClassUnibe/constants/Fonts.dart';
import 'package:GoClassUnibe/constants/Title.dart';
import 'package:GoClassUnibe/widgets/generics/mainApp/BigTitle.dart';
import 'package:flutter/material.dart';
import 'package:GoClassUnibe/constants/Colors.dart';
import 'package:GoClassUnibe/widgets/generics/mainApp/SingleTitle.dart';
import 'package:GoClassUnibe/widgets/generics/mainApp/CategoryText.dart';
import 'package:GoClassUnibe/widgets/generics/mainApp/SettingsCard1.dart';
import 'package:GoClassUnibe/widgets/generics/mainApp/SettingsCard2.dart';
import 'package:provider/provider.dart';
import 'package:GoClassUnibe/services/serviceStudent.dart';
import 'package:scroll_glow_color/widget/scroll_glow_color.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final studentData = Provider.of<StudentData>(context);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        //title: 'MainApp',
        home: Scaffold(
          backgroundColor: colorAppBackground,
          body: ScrollGlowColor(
            color: colorGlow,
            child: ListView(
              shrinkWrap: true,
              children: [
                Container(
//padding: EdgeInsets.symmetric(vertical:16, horizontal: 16),
                    padding: EdgeInsets.only(
                        top: titlePaddingTop(context),
                        left: 16,
                        right: 16,
                        bottom: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BigTitle(
                          title: "Configuración",
                        ),
                        CategoryText(
                          title: "Perfil",
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        //Center(
                        //child: ProfileImage(
                        //name:
                        //studentData.getName + ' ' + studentData.getLastName,
                        //idNumber: (studentData.getIdNumber).toString(),
                        //)),
                        _profileCircle(
                            studentData.getName,
                            studentData.getLastName,
                            studentData.getIdNumber,
                            context),
                        SizedBox(
                          height: 16,
                        ),
                        SettingsCard1(
                          career: studentData.getCareer,
                          email: studentData.getEmail,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        CategoryText(
                          title: "Páginas web",
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        SettingsCard2(),
                        SizedBox(
                          height: 16,
                        ),
                        CategoryText(
                          title: "Sesión",
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Center(
                          child: LogOutApp(),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Center(
                          child: Text("GoClassUnibe V. 0.1",
                              style: TextStyle(
                                  fontFamily: fontApp,
                                  color: colorAppTextLight,
                                  fontSize: 16)),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                      ],
                    ))
              ],
            ),
          ),
        ));
  }

  Widget _profileCircle(String getName, String getLastName, int getIdNumber,
      BuildContext context) {
    return Column(children: [
      CircleAvatar(
        radius: (MediaQuery.of(context).size.width * 0.22) / 2,
        backgroundColor: colorAppSkyBlue,
        child: Text(
          getName[0] + getLastName[0],
          style: TextStyle(
              color: Colors.white.withOpacity(0.7),
              fontSize: 52,
              fontFamily: fontApp,
              fontWeight: FontWeight.bold),
        ),
      ),
      SizedBox(
        height: 16,
      ),
      Center(
          child: Column(children: [
        Text(
          getName + ' ' + getLastName,
          style: TextStyle(
              color: colorAppTextDark,
              fontWeight: FontWeight.bold,
              fontSize: 18,
              fontFamily: fontApp),
        ),
        Text(
          (getIdNumber).toString(),
          style: TextStyle(
              color: colorAppTextLight,
              fontSize: 16,
              fontWeight: FontWeight.w800,
              fontFamily: fontApp),
        )
      ]))
    ]);
  }
}

class LogOutApp extends StatefulWidget {
  @override
  _LogOutAppState createState() => _LogOutAppState();
}

class _LogOutAppState extends State<LogOutApp> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: (() {
            print("Salir");
          }),
          child: Icon(
            Icons.exit_to_app,
            color: colorAppGreen,
          ),
        ),
        SizedBox(
          width: 16,
        ),
        InkWell(
          onTap: (() {
            print("Salir");
          }),
          child: Text("Cerrar Sesión",
              style: TextStyle(
                  color: colorAppGreen,
                  fontFamily: fontApp,
                  fontSize: 18,
                  fontWeight: FontWeight.w600)),
        )
      ],
    );
  }
}
