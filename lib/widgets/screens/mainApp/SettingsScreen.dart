import 'package:GoClassUnibe/constants/Fonts.dart';
import 'package:flutter/material.dart';
import 'package:GoClassUnibe/constants/Colors.dart';
import 'package:GoClassUnibe/widgets/generics/mainApp/BigTitle.dart';
import 'package:GoClassUnibe/widgets/generics/mainApp/SingleTitle.dart';
import 'package:GoClassUnibe/widgets/generics/mainApp/CategoryText.dart';
import 'package:GoClassUnibe/widgets/generics/mainApp/ProfileImage.dart';
import 'package:GoClassUnibe/widgets/generics/mainApp/MainCard.dart';
import 'package:GoClassUnibe/widgets/generics/mainApp/SettingsCard1.dart';
import 'package:GoClassUnibe/widgets/generics/mainApp/SettingsCard2.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MainApp',
        home: Scaffold(
          backgroundColor: colorAppBackground,
          body: ListView(
            shrinkWrap: true,
            children: [
              Container(
//padding: EdgeInsets.symmetric(vertical:16, horizontal: 16),
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.07,
                      left: 16,
                      right: 16,
                      bottom: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SingleTitle(
                        title: "Configuración",
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      CategoryText(
                        title: "Perfil",
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Center(
                          child: ProfileImage(
                        name: 'Scarlett Johansson',
                        idNumber: '1726499393',
                      )),
                      SizedBox(
                        height: 16,
                      ),
                      SettingsCard1(
                        career: 'Ingeniería de Software',
                        email: 'scarlett2020@hotmail.es',
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
        ));
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
            color: colorAppPurple,
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
                  color: colorAppPurple,
                  fontFamily: fontApp,
                  fontSize: 18,
                  fontWeight: FontWeight.w600)),
        )
      ],
    );
  }
}
