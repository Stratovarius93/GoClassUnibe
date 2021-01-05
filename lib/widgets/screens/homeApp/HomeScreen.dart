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
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Background(
            color1: Color.fromRGBO(254, 231, 189, 100),
            color2: Color.fromRGBO(254, 231, 189, 100),
          ),
          Container(
            child: Column(
              children: <Widget>[
                Image.asset('images/Go.png',
                    height: MediaQuery.of(context).size.width * 0.8,
                    width: MediaQuery.of(context).size.width * 0.8),
                MainTitle(
                  colorText: Color.fromRGBO(22, 53, 96, 38),
                  Title: "GoClass UNIB.E",
                ),
                SecondMiniText(
                  colorText: colorAppTextDark,
                  Title:
                      "Consulta tu información académica, crea tu horario y más desde un solo lugar",
                ),
                ButtonFirst(
                  color1: Color.fromRGBO(255, 188, 62, 100),
                  color2: Color.fromRGBO(22, 53, 96, 38),
                  colorText1: Color.fromRGBO(22, 53, 96, 38),
                  colorText2: colorAppBackground,
                  title: "Iniciar Sesión",
                ),
                ButtonFirst(
                  color1: Color.fromRGBO(22, 53, 96, 38),
                  color2: Color.fromRGBO(255, 188, 62, 100),
                  colorText1: colorAppBackground,
                  colorText2: Color.fromRGBO(22, 53, 96, 38),
                  title: "Registrarse",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
