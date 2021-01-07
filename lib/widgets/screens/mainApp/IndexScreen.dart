import 'package:GoClassUnibe/constants/Sizes.dart';
import 'package:flutter/material.dart';
import 'package:GoClassUnibe/widgets/screens/mainApp/Schedule2Screen.dart';
import 'package:GoClassUnibe/widgets/screens/mainApp/DasshboardScreen.dart';
import 'package:GoClassUnibe/widgets/screens/mainApp/RatingsScreen.dart';
import 'package:GoClassUnibe/widgets/screens/mainApp/SettingsScreen.dart';
import 'package:GoClassUnibe/constants/Colors.dart';
import 'package:ionicons/ionicons.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';

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
    ColorfulSafeArea(color: colorAppBackground, child: DasshboardScreen()),
    ColorfulSafeArea(color: colorAppBackground, child: Schedule2Screen()),
    ColorfulSafeArea(color: colorAppBackground, child: RatingsScreen()),
    ColorfulSafeArea(color: colorAppBackground, child: SettingsScreen()),
  ];
  List<ElementItemIcon> _elementItemIconList = [
    ElementItemIcon(Ionicons.home, Ionicons.home_outline, "Home"),
    ElementItemIcon(Ionicons.calendar, Ionicons.calendar_outline, "Home"),
    ElementItemIcon(Ionicons.checkbox, Ionicons.checkbox_outline, "Home"),
    ElementItemIcon(Ionicons.person, Ionicons.person_outline, "Home"),
  ];
  List<bool> _selected = [true, false, false, false, false];
  @override
  Widget build(BuildContext context) {
    _iconSize = ConstWidthScreen(context) * 0.08;
    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.blueGrey.shade100,
                blurRadius: 12,
                offset: Offset(0.0, 0.0),
                spreadRadius: 4)
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
            elevation: 2.0,
            items: _elementItemIconList.map((val) {
              var subIndex = _elementItemIconList.indexOf(val);
              var iconData =
                  _selected[subIndex] ? val.iconData : val.iconDataOutline;
              return _iconNavBar(iconData, Text(val.name));
            }).toList(),
            onTap: (index) {
              setState(() {
                _currentIndex = index;
                for (int buttonIndex = 0;
                    buttonIndex < _selected.length;
                    buttonIndex++) {
                  if (buttonIndex == index) {
                    _selected[buttonIndex] = true;
                  } else {
                    _selected[buttonIndex] = false;
                  }
                }
              });
            },
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem _iconNavBar(IconData iconData, Widget text) {
    return BottomNavigationBarItem(
        icon: Icon(
          iconData,
          size: _iconSize,
        ),
        title: text);
  }
}

class ElementItemIcon {
  IconData iconData;
  IconData iconDataOutline;
  String name;
  ElementItemIcon(this.iconData, this.iconDataOutline, this.name);
}
