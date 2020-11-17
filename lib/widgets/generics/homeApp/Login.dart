import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:GoClassUnibe/widgets/generics/homeApp/Input.dart';
import 'package:GoClassUnibe/constants/Colors.dart';
import 'package:GoClassUnibe/widgets/generics/homeApp/Title.dart';
import 'package:GoClassUnibe/widgets/generics/homeApp/LoginButton.dart';
import 'package:GoClassUnibe/widgets/generics/homeApp/MiniText.dart';
import 'package:GoClassUnibe/widgets/generics/homeApp/PasswordInput.dart';


class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          MainTitle(
            colorText: colorButtonBlueDark1,
            Title: "Iniciar Sesión",
          ),
          CreateEmailInput(
            color: colorInputBlueLight,
            colorText: colorButtonBlueDark1,
            Title: "Ingrese su cédula",
            icon: new Icon(Icons.account_circle, color: colorButtonBlueDark1,),
          ),
          CreatePasswordInput(
            color: colorInputBlueLight,
            colorText: colorButtonBlueDark1,
            icon: new Icon(Icons.vpn_key,color: colorButtonBlueDark1,),
            Title: "Ingrese su contraseña",
          ),
          CreateLoginButton(
            color: colorButtonBlueDark1,
            colorText: colorInputBlueLight,
            icon: new Icon(Icons.arrow_forward),
            Title: "Iniciar Sesión",
          ),
          CreateMiniText(
            colorText: colorButtonBlueDark1,
            Title: "Olvidaste tu contraseña? Restaura aquí",
          ),
        ],
      ),
      
    );
  }
}