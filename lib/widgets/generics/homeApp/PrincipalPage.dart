import 'package:GoClassUnibe/widgets/generics/homeApp/ButtonFirst.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:GoClassUnibe/constants/Colors.dart';
import 'package:GoClassUnibe/widgets/generics/homeApp/Title.dart';
import 'package:GoClassUnibe/widgets/generics/homeApp/MiniText.dart';



class PrincipalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          MainTitle(
            colorText: colorAppPurple,
            Title: "GoClass UNIB.E",
          ),
          CreateMiniText(
            colorText: colorAppTextDark,
            Title: "Consulta tu información académica, crea tu horario y más desde un solo lugar",
          ),
          ButtonFirst(
            color1: colorButtonPurpleLight1,
            color2: colorButtonPurpleDark2,
            colorText1: colorButtonPurpleDark1,
            colorText2: colorAppBackground,
            title: "Iniciar Sesión",
          ),
          ButtonFirst(
            color1: colorButtonPurpleDark2,
            color2: colorButtonPurpleLight1,
            colorText1: colorAppBackground,
            colorText2: colorButtonPurpleDark2,
            title: "Registrarse",
          ),
        ],
      ),

    );
  }
}
