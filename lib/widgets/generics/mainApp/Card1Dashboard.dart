import 'package:GoClassUnibe/constants/Colors.dart';
import 'package:GoClassUnibe/constants/Fonts.dart';
import 'package:GoClassUnibe/constants/Shadows.dart';
import 'package:flutter/material.dart';

class Card1Dashboard extends StatelessWidget {
  final String subject;
  final String teacherName;
  final String subjectTime;
  final String classRoom;
  const Card1Dashboard(
      {Key key,
      this.classRoom,
      this.teacherName,
      this.subjectTime,
      this.subject})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 16),
      width: MediaQuery.of(context).size.width * 0.85,
      //height: MediaQuery.of(context).size.height * 0.4,
      decoration: BoxDecoration(
          boxShadow: <BoxShadow>[boxShadowApp],
          borderRadius: BorderRadius.circular(16),
          color: Colors.white),
      child: Column(
        children: [
          SignatureCard(subject: subject),
          SizedBox(
            height: 16,
          ),
          TeacherCard(teacherName: teacherName),
          SizedBox(
            height: 40,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            TimeCard(subjectTime: subjectTime),
            ClassRoomCard(classRoom: classRoom),
          ]),
        ],
      ),
    );
  }
}

class SignatureCard extends StatelessWidget {
  const SignatureCard({
    Key key,
    @required this.subject,
  }) : super(key: key);

  final String subject;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 18,
          backgroundColor: colorAppYellow,
          child: Icon(
            Icons.book,
            color: Colors.white,
            size: 24,
          ),
        ),
        SizedBox(
          width: 16,
        ),
        Expanded(
          child: Text(subject,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: colorAppTextDark,
                fontFamily: fontApp,
              )),
        )
      ],
    );
  }
}

class TeacherCard extends StatelessWidget {
  const TeacherCard({
    Key key,
    @required this.teacherName,
  }) : super(key: key);

  final String teacherName;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: Text(teacherName,
          style: TextStyle(
            fontSize: 18,
            fontFamily: fontApp,
            //fontStyle: FontStyle.italic,
            color: colorAppTextLight,
          )),
    );
  }
}

class ClassRoomCard extends StatelessWidget {
  const ClassRoomCard({
    Key key,
    @required this.classRoom,
  }) : super(key: key);

  final String classRoom;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Icon(
            Icons.location_on,
            color: colorAppGreen,
          ),
          SizedBox(
            width: 8,
          ),
          Text(
            classRoom,
            style: TextStyle(
                fontFamily: fontApp, fontSize: 16, color: colorAppTextLight),
          )
        ],
      ),
    );
  }
}

class TimeCard extends StatelessWidget {
  const TimeCard({
    Key key,
    @required this.subjectTime,
  }) : super(key: key);

  final String subjectTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 4, bottom: 4, left: 8, right: 8),
      decoration: BoxDecoration(
          color: colorAppRed.withOpacity(0.2),
          borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          Icon(
            Icons.access_time,
            color: colorAppRed,
          ),
          SizedBox(
            width: 8,
          ),
          Text(
            subjectTime,
            style: TextStyle(
                fontFamily: fontApp, fontSize: 16, color: colorAppRed),
          )
        ],
      ),
    );
  }
}
