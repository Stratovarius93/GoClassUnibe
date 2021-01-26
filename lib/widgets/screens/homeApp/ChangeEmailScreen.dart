import 'package:GoClassUnibe/constants/Colors.dart';
import 'package:GoClassUnibe/constants/Fonts.dart';
import 'package:GoClassUnibe/preferences/userPreferences.dart';
import 'package:GoClassUnibe/providers/LoginProvider.dart';
import 'package:GoClassUnibe/requests/AuthFirebase.dart';
import 'package:GoClassUnibe/utils/LoadingButton.dart';
import 'package:GoClassUnibe/utils/modalError.dart';
import 'package:GoClassUnibe/widgets/generics/homeApp/Background2.dart';
import 'package:GoClassUnibe/widgets/generics/homeApp/Input.dart';
import 'package:GoClassUnibe/widgets/generics/homeApp/LoginButton.dart';
import 'package:GoClassUnibe/widgets/generics/homeApp/MiniText.dart';
import 'package:GoClassUnibe/widgets/generics/homeApp/Title.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';

final _prefs = new UserPreferences();

class ChangeEmailScreen extends StatelessWidget {
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
                      "Para cambiar tu correo electrónico es necesario que ingreses tu contraseña.",
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
                    textInputType: TextInputType.text,
                    maxLength: 32,
                    obscureText: true,
                    icon: new Icon(
                      Icons.vpn_key,
                      color: colorAppSkyBlue,
                    ),
                    title: "Ingrese su contraseña",
                    onchanged: (value) {
                      loginProvider.setPassword = value;
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
                            Title: "Verificar",
                            onTap: _validateButton(loginProvider)
                                ? () async {
                                    loginProvider.setStatus = true;
                                    _signIn(context, loginProvider);
                                  }
                                : null,
                          ),
                        ),
                  CreateMiniText(
                      colorText: colorAppBlue,
                      title: "¿Olvidaste tu contraseña?  ",
                      title2: 'Restaura aquí',
                      tapGestureRecognizer: TapGestureRecognizer()
                        ..onTap = () => Navigator.pushNamed(
                            context, 'resetPasswordScreen2')),
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
  _prefs.token = '';
  if (loginProvider.getPassword != null) {
    final _email = _prefs.studentEmail;
    Map info = await AuthFirebaseRequest()
        .fetchLogin(_email, loginProvider.getPassword);

    if (info['ok']) {
      loginProvider.setPassword = '';
      loginProvider.setEmail = '';
      Navigator.pushReplacementNamed(context, 'changeEmail2');
    } else {
      showAlert(context, info['message']);
    }

    loginProvider.setStatus = false;
  } else {
    showAlert(
        context, 'Campos vacíos. Asegúrate de llenar los campos para ingresar');
    loginProvider.setStatus = false;
  }
}

bool _validateButton(LoginProvider loginProvider) {
  if (loginProvider.getPassword.length > 0) {
    return true;
  } else {
    return false;
  }
}
