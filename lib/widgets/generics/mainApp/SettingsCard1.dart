import 'package:GoClassUnibe/constants/Colors.dart';
import 'package:GoClassUnibe/constants/Fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:GoClassUnibe/widgets/generics/mainApp/MainCard.dart';

class SettingsCard1 extends StatelessWidget {
  final VoidCallback onTapEmail;
  final VoidCallback onTapPass;
  final String email;
  final String career;
  const SettingsCard1(
      {Key key,
      this.onTapEmail,
      this.onTapPass,
      @required this.email,
      @required this.career})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MainCard(
        childCard: Container(
      width: MediaQuery.of(context).size.width - 32,
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: colorAppYellow,
                child: Icon(
                  Icons.local_library,
                  color: Colors.white,
                  size: 32,
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Text(
                career,
                style: TextStyle(
                    fontFamily: fontApp,
                    color: colorAppTextLight,
                    fontSize: 18,
                    fontWeight: FontWeight.w800),
              )
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            children: [
              CircleAvatar(
                backgroundColor: colorAppYellow,
                child: Icon(
                  Icons.alternate_email,
                  color: Colors.white,
                  size: 32,
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Text(
                email,
                style: TextStyle(
                    fontFamily: fontApp,
                    color: colorAppTextLight,
                    fontSize: MediaQuery.of(context).size.width * 0.04,
                    fontWeight: FontWeight.w800),
              )
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            children: [
              SizedBox(
                width: 32,
              ),
              Icon(
                Icons.edit,
                color: colorAppBlue,
                size: 32,
              ),
              SizedBox(
                width: 16,
              ),
              InkWell(
                onTap: onTapEmail,
                child: Text(
                  "Cambiar correo",
                  style: TextStyle(
                      color: colorAppBlue, fontSize: 16, fontFamily: fontApp),
                ),
              )
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            children: [
              SizedBox(
                width: 32,
              ),
              Icon(
                Icons.lock_sharp,
                color: colorAppBlue,
                size: 32,
              ),
              SizedBox(
                width: 16,
              ),
              InkWell(
                onTap: onTapPass,
                child: Text(
                  "Cambiar contraseña",
                  style: TextStyle(
                      color: colorAppBlue, fontSize: 16, fontFamily: fontApp),
                ),
              )
            ],
          ),
        ],
      ),
    ));
  }
}
