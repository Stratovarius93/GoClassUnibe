import 'package:GoClassUnibe/widgets/generics/homeApp/Background.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:GoClassUnibe/widgets/generics/homeApp/Input.dart';
import 'package:GoClassUnibe/constants/Colors.dart';
import 'package:GoClassUnibe/widgets/generics/homeApp/Title.dart';
import 'package:GoClassUnibe/widgets/generics/homeApp/LoginButton.dart';
import 'package:GoClassUnibe/widgets/generics/homeApp/MiniText.dart';
import 'package:GoClassUnibe/widgets/generics/homeApp/PasswordInput.dart';

class ValidationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Background(
          color1: colorAppBackground,
          color2: colorInputBlueLight,
        ),
        Container(
          child: Column(
            children: <Widget>[
              MainTitle(
                colorText: colorButtonBlueDark1,
                Title: "Validacón",
              ),
              CreateEmailInput(
                icon: new Icon(
                  Icons.check_circle_outline,
                ),
              ),
              CreateMiniText(
                colorText: colorButtonBlueDark1,
                Title: "Estamos validando tu identidad",
              ),
              CreateMiniText(
                colorText: colorButtonBlueDark1,
                Title: "Por favor espere...",
              ),
            ],
          ),
        ),
      ],
    );
  }
}
