import 'package:GoClassUnibe/preferences/userPreferences.dart';
import 'package:GoClassUnibe/providers/LoginProvider.dart';
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

final _prefs = new UserPreferences();

class LoginScreen extends StatelessWidget {
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
        //resizeToAvoidBottomPadding: false,
        //resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
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
                    height: 10,
                  ),
                  MainTitle(
                    colorText: Color.fromRGBO(22, 53, 96, 38),
                    title: "Iniciar Sesión",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Image.asset('images/login2.png',
                      height: MediaQuery.of(context).size.height * 0.35,
                      width: MediaQuery.of(context).size.width * 0.35),
                  SizedBox(
                    height: 40,
                  ),
                  CreateInput(
                    obscureText: false,
                    maxLength: 10,
                    textInputType: TextInputType.number,
                    title: "Ingrese su cédula",
                    icon:
                        new Icon(Icons.account_circle, color: colorAppSkyBlue),
                    onchanged: (value) {
                      loginProvider.setStudentID = int.parse(value);
                    },
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
                            Title: "Iniciar Sesión",
                            onTap: () async {
                              loginProvider.setStatus = true;
                              _signIn(context, loginProvider);
                            },
                          ),
                        ),
                  CreateMiniText(
                      colorText: colorAppBlue,
                      title: "¿Olvidaste tu contraseña?  ",
                      title2: 'Restaura aquí',
                      tapGestureRecognizer: TapGestureRecognizer()
                        ..onTap = () => Navigator.pushNamed(
                            context, 'resetPasswordScreen')),
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

  _signIn(BuildContext context, LoginProvider loginProvider) async {
    final authFirebaseRequest = AuthFirebaseRequest();
    final res = await authFirebaseRequest.fetchUrl();

    if (res) {
      print(res);

      if (loginProvider.getPassword != null &&
          loginProvider.getStudentID != null) {
        final res =
            await SQLServerRequest().getEmailByID(loginProvider.getStudentID);
        print(res);
        if (res != '' && res != 'Failed to load data') {
          Map info = await AuthFirebaseRequest()
              .fetchLogin(res, loginProvider.getPassword);
          if (info['ok']) {
            _prefs.studentID = loginProvider.getStudentID;
            _prefs.studentEmail = res;
            //SQLServerRequest().setStudentID = loginProvider.getStudentID;
            Navigator.pushReplacementNamed(context, 'indexScreen');
          } else {
            showAlert(context, info['message']);
          }
          loginProvider.setEmail = res;
        } else if (res == 'Failed to load data') {
          showAlertConnection(context, 'No se puede conectar con el servidor');
        } else {
          showAlert(context, 'Usuario o contrasena incorrectos');
        }
        loginProvider.setStatus = false;
      } else {
        showAlert(context,
            'Campos vacíos. Asegúrate de llenar los campos para ingresar');
        loginProvider.setStatus = false;
      }
    } else {
      showAlertConnection(context, 'No se pudo obtener la URL');
      loginProvider.setStatus = false;
    }
  }
}
