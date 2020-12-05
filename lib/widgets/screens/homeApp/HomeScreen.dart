import 'package:GoClassUnibe/widgets/generics/homeApp/Background.dart';
import 'package:GoClassUnibe/widgets/generics/homeApp/ButtonFirst.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:GoClassUnibe/constants/Colors.dart';
import 'package:GoClassUnibe/widgets/generics/homeApp/Title.dart';
import 'package:GoClassUnibe/widgets/generics/homeApp/SecondText.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Background(
          color1: colorButtonBlueDark1,
          color2: colorButtonBlueDark1,
        ),
        Container(
          child: Column(
            children: <Widget>[
              Image.asset(
                'images/Go.png',
                height: 250.0,
                width: 320.0,
              ),
              MainTitle(
                colorText: colorAppYellow,
                Title: "GoClass UNIB.E",
              ),
              SecondMiniText(
                colorText: colorAppTextDark,
                Title:
                    "Consulta tu información académica, crea tu horario y más desde un solo lugar",
              ),
              ButtonFirst(
                color1: colorButtonBlueDark1,
                color2: colorButtonBlueDark2,
                colorText1: colorButtonBlueDark1,
                colorText2: colorAppBackground,
                title: "Iniciar Sesión",
              ),
              ButtonFirst(
                color1: colorButtonBlueDark2,
                color2: colorButtonBlueDark1,
                colorText1: colorAppBackground,
                colorText2: colorButtonBlueDark2,
                title: "Registrarse",
              ),
            ],
          ),
        ),
      ],
    );
  }
}
