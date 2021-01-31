import 'package:GoClassUnibe/constants/Colors.dart';
import 'package:GoClassUnibe/constants/Fonts.dart';
import 'package:GoClassUnibe/providers/ResetPasswordProvider.dart';
import 'package:GoClassUnibe/requests/AuthFirebase.dart';
import 'package:GoClassUnibe/utils/LoadingButton.dart';
import 'package:GoClassUnibe/utils/Validators.dart';
import 'package:GoClassUnibe/utils/modalError.dart';
import 'package:GoClassUnibe/utils/signOut.dart';
import 'package:GoClassUnibe/widgets/generics/homeApp/Background2.dart';
import 'package:GoClassUnibe/widgets/generics/homeApp/Input.dart';
import 'package:GoClassUnibe/widgets/generics/homeApp/LoginButton.dart';
import 'package:GoClassUnibe/widgets/generics/homeApp/Title.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';

class ChangePassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ResetPasswordProvider resetPasswordProvider =
        Provider.of<ResetPasswordProvider>(context);
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
                                context, 'indexScreen');
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
                    title: "Cambiar contraseña",
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: colorAppYellow.withOpacity(0.8),
                    child: Icon(
                      Ionicons.mail_outline,
                      color: colorAppBlue.withOpacity(0.8),
                      size: 50,
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Center(
                    child: Text(
                      "Para cambiar tu contraseña te enviaremos un correo con un link para que puedas hacerlo.",
                      style: TextStyle(
                          fontSize: 20,
                          color: colorAppBlue,
                          fontFamily: fontApp),
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  CreateInput(
                    errorText: validatorEmail(resetPasswordProvider.getEmail),
                    maxLength: 32,
                    obscureText: false,
                    textInputType: TextInputType.emailAddress,
                    title: "Ingrese su correo",
                    icon: new Icon(
                      Icons.account_circle,
                      color: colorAppSkyBlue,
                    ),
                    onchanged: (value) {
                      resetPasswordProvider.setEmail = value;
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  (resetPasswordProvider.getStatus)
                      ? Container(child: Center(child: LoadingButton()))
                      : CreateLoginButton(
                          color: colorAppBlue,
                          colorText: colorInputBlueLight,
                          icon: new Icon(Icons.arrow_forward),
                          Title: "Enviar correo",
                          onTap: _validateButton(resetPasswordProvider)
                              ? () async {
                                  resetPasswordProvider.setStatus = true;
                                  _resetPassword(
                                      context, resetPasswordProvider);
                                }
                              : null),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _resetPassword(
      BuildContext context, ResetPasswordProvider resetPasswordProvider) async {
    if (resetPasswordProvider.getEmail != null) {
      print(resetPasswordProvider.getEmail.toString());
      Map info = await AuthFirebaseRequest()
          .fetchResetPassword(resetPasswordProvider.getEmail);
      print(info);
      if (info['ok']) {
        resetPasswordProvider.setEmail = '';
        _showAlert(context,
            'Te hemos enviado un correo con las instrucciones para recuperar tu contraseña',
            () {
          signOut(context);
          Navigator.pushReplacementNamed(context, 'loginScreen');
        });
      } else {
        showAlert(context, info['message']);
      }
      resetPasswordProvider.setStatus = false;
    } else {
      print('There are not data to validate');
    }
  }
}

void _showAlert(BuildContext context, String text, VoidCallback onTap) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: Text(
          'Correo enviado',
          style: TextStyle(
              fontFamily: fontApp,
              color: colorAppTextDark,
              fontWeight: FontWeight.bold),
        ),
        content: Text(
          text,
          style: TextStyle(fontFamily: fontApp, color: colorAppTextDark),
        ),
        actions: [
          FlatButton(
              onPressed: onTap,
              child: Text(
                'Iniciar sesión',
                style: TextStyle(fontFamily: fontApp, color: colorAppSkyBlue),
              ))
        ],
      );
    },
  );
}

bool _validateButton(ResetPasswordProvider resetPasswordProvider) {
  if (validatorEmail(resetPasswordProvider.getEmail) == null &&
      resetPasswordProvider.getEmail.length > 0) {
    return true;
  } else {
    return false;
  }
}
