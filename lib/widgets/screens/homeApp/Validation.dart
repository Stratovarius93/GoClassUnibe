import 'package:GoClassUnibe/widgets/generics/homeApp/Background.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:GoClassUnibe/widgets/generics/homeApp/Input.dart';
import 'package:GoClassUnibe/constants/Colors.dart';
import 'package:GoClassUnibe/widgets/generics/homeApp/Title.dart';
import 'package:GoClassUnibe/widgets/generics/homeApp/LoginButton.dart';
import 'package:GoClassUnibe/widgets/generics/homeApp/MiniText.dart';
import 'package:GoClassUnibe/widgets/generics/homeApp/PasswordInput.dart';

class ValidationScreen extends StatelessWidget {
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
                MainTitle(
                  colorText: colorButtonBlueDark1,
                  Title: "Validación",
                ),
                Image.asset(
                  'images/check.png',
                  height: MediaQuery.of(context).size.height * .5,
                  width: 150.0,
                ),
                CreateMiniText(
                  colorText: colorButtonBlueDark1,
                  Title: "Estamos validando tu identidad",
                ),
                CreateMiniText(
                  colorText: Color.fromRGBO(133, 133, 133, 52),
                  Title: "Por favor espere...",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
