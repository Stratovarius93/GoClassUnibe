import 'package:GoClassUnibe/constants/Sizes.dart';
import 'package:GoClassUnibe/providers/StudentProvider.dart';
import 'package:flutter/material.dart';
import 'package:GoClassUnibe/widgets/screens/mainApp/ScheduleScreen.dart';
import 'package:GoClassUnibe/widgets/screens/mainApp/DasshboardScreen.dart';
import 'package:GoClassUnibe/widgets/screens/mainApp/RatingsScreen.dart';
import 'package:GoClassUnibe/widgets/screens/mainApp/SettingsScreen.dart';
import 'package:GoClassUnibe/constants/Colors.dart';
import 'package:flutter/services.dart';
import 'package:ionicons/ionicons.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';

class IndexScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final studentProvider = Provider.of<StudentProvider>(context);
    if (studentProvider.connectionStatus == true) {
      return HomeMenu();
    } else {
      return connectingScreen(context);
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

Widget connectingScreen(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.white,
    body: Center(
        child: Container(
            width: MediaQuery.of(context).size.width * 0.3,
            height: MediaQuery.of(context).size.width * 0.3,
            child: LoaderUnibeRiv())),
  );
}

class LoaderUnibeRiv extends StatefulWidget {
  @override
  _LoaderUnibeRivState createState() => _LoaderUnibeRivState();
}

class _LoaderUnibeRivState extends State<LoaderUnibeRiv> {
  final riveFileName = 'images/loaderunibe.riv';
  Artboard _artboard;

  @override
  void initState() {
    _loadRiveFile();
    super.initState();
  }

  // loads a Rive file
  void _loadRiveFile() async {
    final bytes = await rootBundle.load(riveFileName);
    final file = RiveFile();

    if (file.import(bytes)) {
      // Select an animation by its name
      setState(() => _artboard = file.mainArtboard
        ..addController(
          SimpleAnimation('loaderUI'),
        ));
    }
  }

  /// Show the rive file, when loaded
  @override
  Widget build(BuildContext context) {
    return _artboard != null
        ? Rive(
            artboard: _artboard,
            fit: BoxFit.cover,
          )
        : Container();
  }
}
