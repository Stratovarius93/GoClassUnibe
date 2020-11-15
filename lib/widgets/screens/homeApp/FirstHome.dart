import 'package:flutter/material.dart';
import 'package:GoClassUnibe/widgets/generics/homeApp/Background.dart';
import 'package:GoClassUnibe/widgets/generics/homeApp/ButtonFirst.dart';
import 'package:GoClassUnibe/constants/Colors.dart';

class FirstHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "First home",
        home: Stack(
          children: [
            Scaffold(
              body: Center(
                child: Background(
                  color1: colorButtonPurpleLight1,
                  color2: colorInputBlueLight,
                ),
              ),
            ),
            Scaffold(
              backgroundColor: Colors.transparent,
              body: Center(
                child: ButtonFirst(
                  title: "Iniciar sesion",
                  onTap: () {
                    print("Iniciando sesion");
                  },
                  color1: colorButtonPurpleDark1,
                  color2: colorButtonPurpleDark2,
                ),
              ),
            )
          ],
        ));
  }
}
