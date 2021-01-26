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
        resizeToAvoidBottomPadding: false,
      body: Stack(
        children: <Widget>[
          Background(
            color1: colorButtonYellow1.withOpacity(0.3),
            color2: colorButtonYellow2.withOpacity(0.3),
          ),
          Container(
              padding: EdgeInsets.all(40),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'images/go2.png',
                  height: 250.0,
                  width: 320.0,
                ),
                MainTitle(
                  colorText: colorAppBlue,
                  title: "GoClass UNIB.E",
                ),
                SecondMiniText(
                  colorText: colorAppTextDark,
                  title:
                      "Consulta tu información académica, crea tu horario y más desde un solo lugar",
                ),
                SizedBox(height: 16,),
                ButtonFirst(
                  color1: colorButtonYellow2,
                  color2: colorButtonYellow1,
                  colorText1: colorButtonBlueDark1,
                  colorText2: colorAppBackground,
                  title: "Iniciar Sesión",
                  onTap: (){
                    Navigator.pushNamed(context, 'loginScreen');
                  },
                ),
                ButtonFirst(
                  color1: colorAppBlue,
                  color2: colorButtonBlueDark1,
                  colorText1: colorAppBackground,
                  colorText2: colorAppBackground,
                  title: "Registrarse",
                  onTap: (){
                    Navigator.pushNamed(context, 'signUpScreen');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
