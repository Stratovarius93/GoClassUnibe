import 'package:GoClassUnibe/constants/Shadows.dart';
import 'package:GoClassUnibe/constants/Fonts.dart';
import 'package:GoClassUnibe/constants/Title.dart';
import 'package:GoClassUnibe/widgets/generics/mainApp/CategoryText.dart';
import 'package:flutter/material.dart';
import 'package:GoClassUnibe/widgets/generics/mainApp/BigTitle.dart';
import 'package:intl/intl.dart';
import 'package:GoClassUnibe/constants/Colors.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:scroll_glow_color/widget/scroll_glow_color.dart';

class ScheduleScreen extends StatefulWidget {
  @override
  _ScheduleScreenState createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  int _index;
  String _currentDay;
  var _date = DateTime.now();
  final List<String> _dayList = [
    'lunes',
    'martes',
    'miércoles',
    'jueves',
    'viernes'
  ];
  final List<bool> _daySelected = [false, false, false, false, false];

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
    _currentDay = DateFormat.EEEE('es_ES').format(_date);
    for (var i = 0, len = _dayList.length; i < len; ++i) {
      if (_dayList[i] == _currentDay) {
        _index = i;
        _daySelected[i] = true;
      } else if (_currentDay == 'sábado' || _currentDay == 'domingo') {
        _index = 0;
        _daySelected[0] = true;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: colorAppBackground,
        body: ScrollGlowColor(
          color: colorGlow,
          child: ListView(children: [
            Container(
                padding: EdgeInsets.only(
                    top: titlePaddingTop(context),
                    left: 16,
                    right: 16,
                    bottom: 0),
                child: BigTitle(
                  title: "Horario",
                )),
            _toggleButtonsDay(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CategoryText(
                title: _dayList[_index],
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Widget _toggleButtonsDay() {
    return ToggleButtons(
      color: colorAppTextDark,
      fillColor: Colors.transparent,
      splashColor: Colors.transparent,
      renderBorder: false,
      children: _dayList.map((val) {
        var subIndex = _dayList.indexOf(val);
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 16),
          child: Container(
            decoration: BoxDecoration(boxShadow: <BoxShadow>[boxShadowApp]),
            child: CircleAvatar(
                radius: (MediaQuery.of(context).size.width * 0.15) / 2,
                backgroundColor:
                    _daySelected[subIndex] ? colorAppBlue : Colors.white,
                child: Text(
                  val[0].toUpperCase(),
                  style: TextStyle(
                      color: _daySelected[subIndex]
                          ? Colors.white
                          : colorAppTextDark,
                      fontFamily: fontApp,
                      fontWeight: FontWeight.w800,
                      fontSize: 30),
                )),
          ),
        );
      }).toList(),
      onPressed: (int index) {
        setState(() {
          for (int buttonIndex = 0;
              buttonIndex < _daySelected.length;
              buttonIndex++) {
            if (buttonIndex == index) {
              _daySelected[buttonIndex] = true;
            } else {
              _daySelected[buttonIndex] = false;
            }
          }
          _index = index;
          print(_dayList[index]);
        });
      },
      isSelected: _daySelected,
    );
  }
}
