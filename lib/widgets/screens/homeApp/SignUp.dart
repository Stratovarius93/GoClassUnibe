import 'package:GoClassUnibe/constants/Fonts.dart';
import 'package:GoClassUnibe/models/StudentModel.dart';
import 'package:GoClassUnibe/providers/SignUpProvider.dart';
import 'package:GoClassUnibe/requests/AuthFirebase.dart';
import 'package:GoClassUnibe/requests/SQLServerRequest.dart';
import 'package:GoClassUnibe/utils/LoadingButton.dart';
import 'package:GoClassUnibe/utils/modalError.dart';
import 'package:GoClassUnibe/widgets/generics/homeApp/Background2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:GoClassUnibe/widgets/generics/homeApp/Input.dart';
import 'package:GoClassUnibe/constants/Colors.dart';
import 'package:GoClassUnibe/widgets/generics/homeApp/Title.dart';
import 'package:GoClassUnibe/widgets/generics/homeApp/LoginButton.dart';
import 'package:GoClassUnibe/widgets/generics/homeApp/MiniText.dart';
import 'package:provider/provider.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SignUpProvider signUpProvider = Provider.of<SignUpProvider>(context);
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Background2(
              color1: colorAppYellow.withOpacity(0.3),
              color2: colorAppYellow.withOpacity(0.3),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: InkWell(
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.all(12.0),
                        child: new IconButton(
                          icon: new Icon(
                            Icons.arrow_back,
                            color: Color.fromRGBO(22, 53, 96, 38),
                          ),
                          iconSize: 30.0,
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, 'homeScreen');
                          },
                        ),
                      ))),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: <Widget>[
                  SizedBox(
                    height: 16,
                  ),
                  MainTitle(
                    colorText: Color.fromRGBO(22, 53, 96, 38),
                    title: "Registro de cuenta",
                  ),
                  Image.asset(
                    'images/signUp.png',
                    height: 200.0,
                    width: 150.0,
                  ),
                  Center(
                    child: Text(
                      "Para crear una cuenta, necesitamos verificar que eres estudiante de la UNIB.E",
                      style: TextStyle(
                          fontSize: 20,
                          color: colorAppBlue,
                          fontFamily: fontApp),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  CreateInput(
                    maxLength: 10,
                    obscureText: false,
                    textInputType: TextInputType.number,
                    title: "Digite su cédula",
                    icon: new Icon(
                      Icons.account_circle,
                      color: colorAppSkyBlue,
                    ),
                    onchanged: (value) {
                      signUpProvider.setStudentID = int.parse(value);
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  (signUpProvider.getStatus)
                      ? Container(child: Center(child: LoadingButton()))
                      : CreateLoginButton(
                          color: colorAppBlue,
                          colorText: colorInputBlueLight,
                          icon: new Icon(Icons.arrow_forward),
                          Title: "Verificar",
                          onTap: () async {
                            signUpProvider.setStatus = true;
                            _validateID(context, signUpProvider);
                          },
                        ),
                  Center(
                    child: CreateMiniText(
                        colorText: colorAppBlue,
                        title: "¿Ya tienes cuenta?  ",
                        title2: 'Ingresa aquí',
                        tapGestureRecognizer: TapGestureRecognizer()
                          ..onTap = () =>
                              Navigator.pushNamed(context, 'loginScreen')),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _validateID(BuildContext context, SignUpProvider signUpProvider) async {
    final authFirebaseRequest = AuthFirebaseRequest();

    final res = await authFirebaseRequest.fetchUrl();
    if (res) {
      print(res);
      if (signUpProvider.getStudentID != null) {
        print(signUpProvider.getStudentID.toString());
        Student student = await SQLServerRequest()
            .fetchStudentID(signUpProvider.getStudentID);
        if (student == null) {
          print('No existe el estudiante');
          showAlert(context,
              'No eres estudiante de la UNIBE. Verifica bien tu cédula');
        } else {
          //print('Si existe el estudiante');
          final res = await SQLServerRequest()
              .getEmailByID(signUpProvider.getStudentID);
          if (res == '') {
            signUpProvider.setStudent = student;
            Navigator.pushNamed(context, 'signUpScreen2');
          } else {
            showAlert(context, 'Ya existen un estudiante con ese número');
          }
        }
        signUpProvider.setStatus = false;
        //signUpProvider.validateID(signUpProvider.getStudentID);
      } else {
        showAlert(context,
            'Campo vacío. Asegúrate de llenar el campo para poder validar.');
        signUpProvider.setStatus = false;
      }
      signUpProvider.setStatus = false;
      //connectionProvider.state2 = false;
    } else {
      showAlertConnection(context, 'No se pudo obtener la URL');
      signUpProvider.setStatus = false;
      //connectionProvider.state = false;
    }
  }
}
