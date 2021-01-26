import 'package:GoClassUnibe/models/StudentModelToDB.dart';
import 'package:GoClassUnibe/providers/SignUpProvider.dart';
import 'package:GoClassUnibe/requests/AuthFirebase.dart';
import 'package:GoClassUnibe/requests/SQLServerRequest.dart';
import 'package:GoClassUnibe/utils/Validators.dart';
import 'package:GoClassUnibe/utils/modalError.dart';
import 'package:GoClassUnibe/widgets/generics/homeApp/Background2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:GoClassUnibe/widgets/generics/homeApp/Input.dart';
import 'package:GoClassUnibe/constants/Colors.dart';
import 'package:GoClassUnibe/widgets/generics/homeApp/Title.dart';
import 'package:GoClassUnibe/widgets/generics/homeApp/LoginButton.dart';
import 'package:GoClassUnibe/widgets/generics/homeApp/MiniText.dart';
import 'package:provider/provider.dart';

class SignUp2 extends StatelessWidget {
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
              color1: colorButtonYellow1.withOpacity(0.3),
              color2: colorButtonYellow2.withOpacity(0.3),
            ),
            ListView(
              physics: BouncingScrollPhysics(),
              children: <Widget>[
                InkWell(
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
                MainTitle(
                  colorText: colorAppBlue,
                  title: "Registro de cuenta",
                ),
                SizedBox(
                  height: 22,
                ),
                CreateMiniText3(
                  title: "NOMBRE:",
                ),
                CreateMiniText2(
                  colorText: colorAppTextDark.withOpacity(0.8),
                  title: (signUpProvider.getStudent == null)
                      ? 'Loading'
                      : signUpProvider.getStudent.name +
                          ' ' +
                          signUpProvider.getStudent.lastName,
                ),
                CreateMiniText3(
                  title: "CORREO:",
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: CreateInput(
                    errorText: validatorEmail(signUpProvider.getEmail),
                    obscureText: false,
                    textInputType: TextInputType.emailAddress,
                    maxLength: 32,
                    title: "Ingrese su correo",
                    icon: new Icon(
                      Icons.alternate_email,
                      color: colorAppSkyBlue,
                    ),
                    onchanged: (value) {
                      signUpProvider.setEmail = value;
                    },
                  ),
                ),
                CreateMiniText3(
                  title: "CONTRASEÑA:",
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: CreateInput(
                    errorText: validatorPassword(signUpProvider.getPassword),
                    maxLength: 32,
                    obscureText: true,
                    textInputType: TextInputType.text,
                    icon: new Icon(
                      Icons.vpn_key,
                      color: colorAppSkyBlue,
                    ),
                    title: "Ingrese su contraseña",
                    onchanged: (value) {
                      signUpProvider.setPassword = value;
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: CreateInput(
                    errorText:
                        validatorPassword(signUpProvider.getRepeatPassword),
                    textInputType: TextInputType.text,
                    obscureText: true,
                    maxLength: 32,
                    icon: new Icon(
                      Icons.vpn_key,
                      color: colorAppSkyBlue,
                    ),
                    title: "Repita su contraseña",
                    onchanged: (value) {
                      signUpProvider.setRepeatPassword = value;
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  child: CreateLoginButton(
                      color: colorAppBlue,
                      colorText: colorInputBlueLight,
                      icon: new Icon(Icons.arrow_forward),
                      Title: "Crear Cuenta",
                      //onTap: () async {
                      //_signUp(context, signUpProvider);
                      //},
                      onTap: _validateButton(signUpProvider)
                          ? () {
                              _signUp(context, signUpProvider);
                            }
                          : null),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  bool _validateButton(SignUpProvider signUpProvider) {
    if (validatorPassword(signUpProvider.getPassword) == null &&
        validatorEmail(signUpProvider.getEmail) == null &&
        validatorPassword(signUpProvider.getRepeatPassword) == null &&
        signUpProvider.getPassword.length > 0 &&
        signUpProvider.getRepeatPassword.length > 0 &&
        signUpProvider.getEmail.length > 0) {
      return true;
    } else {
      return false;
    }
  }

  //_signUp(context, signUpProvider);
  _signUp(BuildContext context, SignUpProvider signUpProvider) async {
    if (signUpProvider.getEmail != null &&
        signUpProvider.getPassword != null &&
        signUpProvider.getRepeatPassword != null) {
      if (signUpProvider.validateEqualPassword(
              signUpProvider.getPassword, signUpProvider.getRepeatPassword) ==
          true) {
        //print('Si es igual');
        Map info = await AuthFirebaseRequest()
            .fetchSignUp(signUpProvider.getEmail, signUpProvider.getPassword);
        if (info['ok']) {
          StudentToDb studentToDB = StudentToDb(
              name: signUpProvider.getStudent.name,
              lastName: signUpProvider.getStudent.lastName,
              studentId: signUpProvider.getStudent.studentId,
              career: signUpProvider.getStudent.career,
              email: signUpProvider.getEmail);
          await SQLServerRequest().addAccount(studentToDB);
          Navigator.pushReplacementNamed(context, 'indexScreen');
        } else {
          showAlert(context, info['message']);
        }
        //Navigator.pushReplacementNamed(context, 'indexScreen');
      } else {
        //print('No es igual');
        showAlert(context, 'La contraseñas ingresadas no coinciden');
      }
    } else {
      print('campos vacios');
    }
  }
}
