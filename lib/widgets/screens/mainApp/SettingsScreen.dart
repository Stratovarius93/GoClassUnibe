import 'package:GoClassUnibe/constants/Fonts.dart';
import 'package:GoClassUnibe/constants/Title.dart';
import 'package:GoClassUnibe/preferences/userPreferences.dart';
import 'package:GoClassUnibe/providers/LoginProvider.dart';
import 'package:GoClassUnibe/providers/StudentProvider.dart';
import 'package:GoClassUnibe/utils/signOut.dart';
import 'package:GoClassUnibe/widgets/generics/mainApp/BigTitle.dart';
import 'package:GoClassUnibe/widgets/generics/mainApp/LoadingCircle.dart';
import 'package:flutter/material.dart';
import 'package:GoClassUnibe/constants/Colors.dart';
import 'package:GoClassUnibe/widgets/generics/mainApp/CategoryText.dart';
import 'package:GoClassUnibe/widgets/generics/mainApp/SettingsCard1.dart';
import 'package:GoClassUnibe/widgets/generics/mainApp/SettingsCard2.dart';
import 'package:provider/provider.dart';
import 'package:scroll_glow_color/widget/scroll_glow_color.dart';

final _prefs = new UserPreferences();

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final studentProvider = Provider.of<StudentProvider>(context);
    final loginProvider = Provider.of<LoginProvider>(context);
    return Scaffold(
      backgroundColor: colorAppBackground,
      body: ScrollGlowColor(
        color: colorGlow,
        child: ListView(
          physics: BouncingScrollPhysics(),
          //shrinkWrap: true,
          children: [
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
                      title: "Configuración",
                    ),
                    CategoryText(
                      title: "Perfil",
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    (studentProvider.getStudent() == null)
                        ? LoadingCircle(
                            loadingText: 'Cargando perfil...',
                          )
                        : _profileCircle(
                            studentProvider.getStudent().name,
                            studentProvider.getStudent().lastName,
                            studentProvider.getStudent().studentId,
                            context),
                    SizedBox(
                      height: 16,
                    ),
                    (studentProvider.getStudent() == null &&
                            loginProvider.getEmail == null)
                        ? SettingsCard1(
                            email: 'correo',
                            career: 'carrera',
                            onTapPass: () {},
                            onTapEmail: () {},
                          )
                        : SettingsCard1(
                            //email: loginProvider.getEmail??'cargando',
                            email: _prefs.studentEmail,
                            career: studentProvider.getStudent().career,
                            onTapPass: () {
                              Navigator.pushNamed(context, 'changePassword');
                            },
                            onTapEmail: () {
                              Navigator.pushNamed(context, 'changeEmail');
                            },
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
    );
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
    LoginProvider loginProvider = Provider.of<LoginProvider>(context);
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
          onTap: () async {
            await loginProvider.disposeLogin();
            signOut(context);
            Navigator.popAndPushNamed(context, 'homeScreen');
            //SystemChannels.platform.invokeMethod('SystemNavigator.pop');
          },
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
