import 'package:GoClassUnibe/widgets/generics/homeApp/Background.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:GoClassUnibe/widgets/generics/homeApp/Title.dart';
import 'package:GoClassUnibe/widgets/generics/homeApp/MiniText.dart';

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
                  colorText: Color.fromRGBO(22, 53, 96, 38),
                  title: "Validación",
                ),
                Image.asset('images/check.png',
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.width * 0.5),
                CreateMiniText(
                  colorText: Color.fromRGBO(22, 53, 96, 38),
                  title: "Estamos validando tu identidad",
                ),
                CreateMiniText2(
                  colorText: Color.fromRGBO(22, 53, 96, 38),
                  title: "Por favor Espere...",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
