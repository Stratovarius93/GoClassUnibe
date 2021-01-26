import 'package:GoClassUnibe/constants/Colors.dart';
import 'package:GoClassUnibe/constants/Fonts.dart';
import 'package:GoClassUnibe/preferences/userPreferences.dart';
import 'package:GoClassUnibe/providers/LoginProvider.dart';
import 'package:GoClassUnibe/requests/AuthFirebase.dart';
import 'package:GoClassUnibe/requests/SQLServerRequest.dart';
import 'package:GoClassUnibe/utils/LoadingButton.dart';
import 'package:GoClassUnibe/utils/Validators.dart';
import 'package:GoClassUnibe/utils/modalError.dart';
import 'package:GoClassUnibe/widgets/generics/homeApp/Background2.dart';
import 'package:GoClassUnibe/widgets/generics/homeApp/Input.dart';
import 'package:GoClassUnibe/widgets/generics/homeApp/LoginButton.dart';
import 'package:GoClassUnibe/widgets/generics/homeApp/Title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';

final _prefs = new UserPreferences();

class ChangeEmail2Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LoginProvider loginProvider = Provider.of<LoginProvider>(context);
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: <Widget>[
            Background2(
              color1: colorButtonYellow1.withOpacity(0.3),
              color2: colorButtonYellow2.withOpacity(0.3),
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
                                context, 'changeEmail');
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
                    title: "Cambiar email",
                  ),
                  SizedBox(
                    height: 20,
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
                      "A continuación ingresa tu nuevo correo electrónico",
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
                    errorText: validatorEmail(loginProvider.getEmail),
                    textInputType: TextInputType.emailAddress,
                    maxLength: 32,
                    obscureText: false,
                    icon: new Icon(
                      Icons.email,
                      color: colorAppSkyBlue,
                    ),
                    title: "Ingrese su nuevo correo",
                    onchanged: (value) {
                      loginProvider.setEmail = value;
                    },
                  ),
                  (loginProvider.getStatus)
                      ? Container(child: Center(child: LoadingButton()))
                      : Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: CreateLoginButton(
                            color: colorAppBlue,
                            colorText: colorInputBlueLight,
                            icon: new Icon(Icons.arrow_forward),
                            Title: "Actualizar correo",
                            onTap: _validateButton(loginProvider)
                                ? () async {
                                    loginProvider.setStatus = true;
                                    _signIn(context, loginProvider);
                                  }
                                : null,
                          ),
                        ),
                  SizedBox(
                    height: 16,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

_signIn(BuildContext context, LoginProvider loginProvider) async {
  if (loginProvider.getEmail != null) {
    final res1 =
        await AuthFirebaseRequest().fetchChangeEmail(loginProvider.getEmail);

    if (res1 == true) {
      final res2 = await SQLServerRequest()
          .updateEmailByID(_prefs.studentID, loginProvider.getEmail);
      if (res2 == true) {
        _showAlert(context,
            'Para actualizar los cambios con tu nuevo correo, es necesario reiniciar la sesión.',
            () {
          _prefs.studentID = 0;
          _prefs.token = '';
          _prefs.studentEmail = '';
          Phoenix.rebirth(context);
          Navigator.popAndPushNamed(context, 'homeScreen');
        });
      } else {
        showAlert(context, 'Algo ocurrió con el servidor de UNIBE');
      }
    } else {
      showAlert(context,
          'Algo ocurrió. Verifica tu conexión con el servidor de autenticación');
    }
    loginProvider.setStatus = false;
  } else {
    showAlert(
        context, 'Campos vacíos. Asegúrate de llenar los campos para ingresar');
    loginProvider.setStatus = false;
  }
}

bool _validateButton(LoginProvider loginProvider) {
  if (validatorEmail(loginProvider.getEmail) == null &&
      loginProvider.getEmail.length > 0) {
    return true;
  } else {
    return false;
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
          'Correo cambiado',
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
                style: TextStyle(
                    fontFamily: fontApp, color: colorAppSkyBlue, fontSize: 18),
              ))
        ],
      );
    },
  );
}
