import 'package:flutter/material.dart';
import 'package:GoClassUnibe/widgets/screens/mainApp/ScheduleScreen.dart';
import 'package:GoClassUnibe/widgets/screens/mainApp/DasshboardScreen.dart';
import 'package:GoClassUnibe/widgets/screens/mainApp/RecordScreen.dart';
import 'package:GoClassUnibe/widgets/screens/mainApp/RatingsScreen.dart';
import 'package:GoClassUnibe/widgets/screens/mainApp/SettingsScreen.dart';
import 'package:GoClassUnibe/constants/Shadows.dart';
import 'package:GoClassUnibe/constants/Colors.dart';

class IndexScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: HomeMenu(),
    );
  }
}

class HomeMenu extends StatefulWidget {
  @override
  _HomeMenuState createState() => _HomeMenuState();
}

class _HomeMenuState extends State<HomeMenu> {
  double _iconSize = 0;
  int _currentIndex = 0;
  final tabs = [
    DasshboardScreen(),
    RecordScreen(),
    ScheduleScreen(),
    RatingsScreen(),
    SettingsScreen()
  ];
  @override
  Widget build(BuildContext context) {
    _iconSize = MediaQuery.of(context).size.width*0.08;
    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: colorNavBarButtonDisable.withOpacity(0.8),
                blurRadius: 22,
                offset: Offset(0.0, 0.0),
                spreadRadius: 8)
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(22), topRight: Radius.circular(22)),
          child: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: _currentIndex,
            type: BottomNavigationBarType.fixed,
            //backgroundColor: white,
            selectedItemColor: colorNavBarButtonActive,
            unselectedItemColor: colorNavBarButtonDisable,
            elevation: 6.0,
            items: [
              BottomNavigationBarItem(

                  icon: Icon(Icons.home, size:_iconSize),
                title: Text("Inicio"),
                //backgroundColor: Colors.blue
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.format_list_bulleted, size:_iconSize),
                title: Text("Récord"),
                //backgroundColor: Colors.blue
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.date_range, size:_iconSize),
                title: Text("Horario"),
                //backgroundColor: Colors.blue
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.assignment, size:_iconSize),
                title: Text("Notas"),
                //backgroundColor: Colors.blue
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle, size:_iconSize),
                title: Text("Cuenta"),
                //backgroundColor: Colors.blue
              )
            ],
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
