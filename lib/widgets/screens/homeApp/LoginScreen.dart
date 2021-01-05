import 'package:GoClassUnibe/widgets/generics/homeApp/Background.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:GoClassUnibe/widgets/generics/homeApp/Input.dart';
import 'package:GoClassUnibe/constants/Colors.dart';
import 'package:GoClassUnibe/widgets/generics/homeApp/Title.dart';
import 'package:GoClassUnibe/widgets/generics/homeApp/LoginButton.dart';
import 'package:GoClassUnibe/widgets/generics/homeApp/MiniText.dart';
import 'package:GoClassUnibe/widgets/generics/homeApp/PasswordInput.dart';

class LoginScreen extends StatelessWidget {
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
                  Title: "Iniciar Sesión",
                ),
                Image.asset(
                  'images/login.png',
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width * 0.5),
                CreateEmailInput(
                  color: colorInputBlueLight,
                  colorText: Color.fromRGBO(22, 53, 96, 38),
                  Title: "Ingrese su cédula",
                  icon: new Icon(
                    Icons.account_circle,
                    color: Color.fromRGBO(22, 53, 96, 38),
                  ),
                ),
                CreatePasswordInput(
                  color: colorInputBlueLight,
                  colorText: Color.fromRGBO(22, 53, 96, 38),
                  icon: new Icon(
                    Icons.vpn_key,
                    color: Color.fromRGBO(22, 53, 96, 38),
                  ),
                  Title: "Ingrese su contraseña",
                ),
                CreateLoginButton(
                  color: Color.fromRGBO(22, 53, 96, 38),
                  colorText: colorInputBlueLight,
                  icon: new Icon(Icons.arrow_forward),
                  Title: "Iniciar Sesión",
                ),
                CreateMiniText(
                  colorText: Color.fromRGBO(22, 53, 96, 38),
                  Title: "Olvidaste tu contraseña? Restaura aquí",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
