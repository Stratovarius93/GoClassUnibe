import 'package:GoClassUnibe/constants/Colors.dart';
import 'package:GoClassUnibe/constants/Fonts.dart';
import 'package:GoClassUnibe/providers/StudentProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

TextStyle _textStyle1 = TextStyle(
    fontFamily: fontApp,
    color: colorAppTextDark,
    fontSize: 25,
    fontWeight: FontWeight.bold);

TextStyle _textStyle2 = TextStyle(
  fontFamily: fontApp,
  color: colorAppTextLight,
  fontSize: 20,
);

class ConnectingScreen extends StatelessWidget {
  static final String routeName = 'ConnectingScreen';

  @override
  Widget build(BuildContext context) {
    final studentProvider = Provider.of<StudentProvider>(context);
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(colorAppTextLight),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                'Cargando ...',
                style: _textStyle1,
              ),
              (studentProvider.connectionStatus ==false)
              ? Text('Conectando')
              :Text('Conectado ...'),
            ],
          ),
        ),
      ),
    );
  }

}
