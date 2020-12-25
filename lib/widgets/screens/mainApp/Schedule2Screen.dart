import 'package:GoClassUnibe/constants/Colors.dart';
import 'package:GoClassUnibe/constants/Fonts.dart';
import 'package:GoClassUnibe/constants/Shadows.dart';
//import 'package:GoClassUnibe/data/exampleSchedule.dart';
import 'package:GoClassUnibe/widgets/generics/mainApp/CategoryText.dart';
//import 'package:GoClassUnibe/widgets/generics/mainApp/ReorderableListSchedule.dart';
import 'package:GoClassUnibe/widgets/generics/mainApp/ScheduleDay.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class Schedule2Screen extends StatefulWidget {
  @override
  _Schedule2ScreenState createState() => _Schedule2ScreenState();
}

int _index;
int _currentIndex = 0;
TabController _controller;
final List<String> _weekDays = [
  'lunes',
  'martes',
  'miércoles',
  'jueves',
  'viernes'
];
List<bool> _daySelected = [false, false, false, false, false];

class _Schedule2ScreenState extends State<Schedule2Screen>
    with SingleTickerProviderStateMixin {
  //TabController _controller;
  VoidCallback onChanged;
  TabBarView tabBarView;
  String _currentDay;
  var _date = DateTime.now();

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
    _currentDay = DateFormat.EEEE('es_ES').format(_date);
    print(_currentDay);
    for (var i = 0, len = _weekDays.length; i < len; ++i) {
      if (_weekDays[i] == _currentDay) {
        _index = i;
        _daySelected[i] = true;
      } else if (_currentDay == 'sábado' || _currentDay == 'domingo') {
        _index = 0;
        _daySelected[0] = true;
      }
    }
    //print(_index);
    _controller = new TabController(
        initialIndex: _index, length: _weekDays.length, vsync: this);
    onChanged = () {
      setState(() {
        _currentIndex = _controller.index;
        //_currentIndex = _index;
        //print(_controller.index);
      });
    };
    _controller.addListener(onChanged);
  }

  @override
  void dispose() {
    // Dispose of the Tab Controller
    _controller.removeListener(onChanged);
    _controller.dispose();
    super.dispose();
    _daySelected = [false, false, false, false, false];

    print('terminado');
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _weekDays.length,
      child: Scaffold(
        backgroundColor: colorAppBackground,
        appBar: AppBar(
          actions: [
            InkWell(
              onTap: () {
                print("Hola mundo");
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: Icon(
                    Icons.more_vert,
                    color: colorAppBlue,
                  ),
                ),
              ),
            )
          ],
          centerTitle: true,
          elevation: 0,
          backgroundColor: colorAppBackground,
          title: Text('Horario',
              style: TextStyle(
                  color: colorAppTextDark,
                  fontFamily: fontApp,
                  fontSize: 28,
                  fontWeight: FontWeight.bold)),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(86),
            child: Container(
              height: 86,
              child: TabBarWidget(),
            ),
          ),
        ),
        body: TabViewWidget(),
      ),
    );
  }
}

class TabViewWidget extends StatefulWidget {
  @override
  _TabViewWidgetState createState() => _TabViewWidgetState();
}

class _TabViewWidgetState extends State<TabViewWidget>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return TabBarView(
      //controller: TabController(
      //initialIndex: _currentIndex, length: _weekDays.length, vsync: this),
      physics: NeverScrollableScrollPhysics(),
      controller: _controller,
      children: [
        _DayView(
          dayName: _weekDays[0],
        ),
        _DayView(
          dayName: _weekDays[1],
        ),
        _DayView(
          dayName: _weekDays[2],
        ),
        _DayView(
          dayName: _weekDays[3],
        ),
        _DayView(
          dayName: _weekDays[4],
        ),
      ],
    );
  }
}

class TabBarWidget extends StatefulWidget {
  @override
  _TabBarWidgetState createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> {
  @override
  Widget build(BuildContext context) {
    return TabBar(
      physics: BouncingScrollPhysics(),
      controller: _controller,
      onTap: (int index) {
        setState(() {
          _currentIndex = index;
          for (int buttonIndex = 0;
              buttonIndex < _daySelected.length;
              buttonIndex++) {
            if (buttonIndex == _currentIndex) {
              _daySelected[buttonIndex] = true;
            } else {
              _daySelected[buttonIndex] = false;
            }
          }
        });
      },
      isScrollable: true,
      indicatorColor: Colors.transparent,
      tabs: _weekDays.map(
        (item) {
          var index = _weekDays.indexOf(item);
          return Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle, boxShadow: [boxShadowApp]),
            child: CircleAvatar(
              radius: 30,
              backgroundColor:
                  _daySelected[index] ? colorAppBlue : Colors.white,
              child: Text(
                item[0].toUpperCase(),
                style: TextStyle(
                    color: _daySelected[index] ? Colors.white : colorAppBlue,
                    fontFamily: fontApp,
                    fontWeight: FontWeight.w800,
                    fontSize: 30),
              ),
            ),
          );
        },
      ).toList(),
    );
  }
}

class _DayView extends StatelessWidget {
  final String dayName;

  const _DayView({Key key, this.dayName}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: CategoryText(
            title: dayName,
          ),
        ),
        //Expanded(child: ReorderableListSchedula())
        Expanded(
          //child: ReorderableListSchedule(signatureList: signatureListExample))
          child: ScheduleDay(),
        )
      ],
    );
  }
}
