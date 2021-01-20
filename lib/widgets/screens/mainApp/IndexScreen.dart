import 'package:GoClassUnibe/constants/Fonts.dart';
import 'package:GoClassUnibe/constants/Sizes.dart';
import 'package:GoClassUnibe/providers/StudentProvider.dart';
import 'package:flutter/material.dart';
import 'package:GoClassUnibe/widgets/screens/mainApp/ScheduleScreen.dart';
import 'package:GoClassUnibe/widgets/screens/mainApp/DasshboardScreen.dart';
import 'package:GoClassUnibe/widgets/screens/mainApp/RatingsScreen.dart';
import 'package:GoClassUnibe/widgets/screens/mainApp/SettingsScreen.dart';
import 'package:GoClassUnibe/constants/Colors.dart';
import 'package:ionicons/ionicons.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:provider/provider.dart';

class IndexScreen extends StatelessWidget {
  static final String routeName = 'indexScreen';
  @override
  Widget build(BuildContext context) {
    final studentProvider = Provider.of<StudentProvider>(context);
    if (studentProvider.connectionStatus == true) {
      return HomeMenu();
    } else {
      return connectingScreen();
    }
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
    ColorfulSafeArea(color: colorAppBackground, child: ScheduleScreen()),
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

Widget connectingScreen() {
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
          ],
        ),
      ),
    ),
  );
}
