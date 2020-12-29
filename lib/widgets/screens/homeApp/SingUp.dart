import 'package:GoClassUnibe/widgets/generics/homeApp/Background.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:GoClassUnibe/widgets/generics/homeApp/Input.dart';
import 'package:GoClassUnibe/constants/Colors.dart';
import 'package:GoClassUnibe/widgets/generics/homeApp/Title.dart';
import 'package:GoClassUnibe/widgets/generics/homeApp/LoginButton.dart';
import 'package:GoClassUnibe/widgets/generics/homeApp/MiniText.dart';
import 'package:GoClassUnibe/widgets/generics/homeApp/PasswordInput.dart';

class SignUp extends StatelessWidget {
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
                  colorText: Color.fromRGBO(22, 53, 96, 38),
                  Title: "Registro de cuenta",
                ),
                Image.asset(
                  'images/signUp.png',
                  height: 200.0,
                  width: 150.0,
                ),
                CreateMiniText(
                  colorText: Color.fromRGBO(22, 53, 96, 38),
                  Title:
                      "Para crear una cuenta, necesitamos verificar que eres estudiante de la UNIB.E",
                ),
                CreateMiniText(
                  colorText: Color.fromRGBO(133, 133, 133, 52),
                  Title: "A continuación, ingresa tu número de cédula",
                ),
                CreateEmailInput(
                  color: colorInputBlueLight,
                  colorText: Color.fromRGBO(22, 53, 96, 38),
                  Title: "Digite su cédula",
                  icon: new Icon(
                    Icons.account_circle,
                    color: Color.fromRGBO(22, 53, 96, 38),
                  ),
                ),
                CreateLoginButton(
                  color: Color.fromRGBO(22, 53, 96, 38),
                  colorText: colorInputBlueLight,
                  icon: new Icon(Icons.arrow_forward),
                  Title: "Verificar",
                ),
                CreateMiniText(
                  colorText: Color.fromRGBO(22, 53, 96, 38),
                  Title: "¿Ya tienes cuenta? Ingresa aquí",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
