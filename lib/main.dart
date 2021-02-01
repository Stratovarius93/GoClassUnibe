import 'package:GoClassUnibe/constants/Colors.dart';
import 'package:GoClassUnibe/preferences/userPreferences.dart';
import 'package:GoClassUnibe/providers/LoginProvider.dart';
import 'package:GoClassUnibe/providers/PeriodProvider.dart';
import 'package:GoClassUnibe/providers/RatingProvider.dart';
import 'package:GoClassUnibe/providers/RegistrationProvider.dart';
import 'package:GoClassUnibe/providers/ResetPasswordProvider.dart';
import 'package:GoClassUnibe/providers/ScheduleProvider.dart';
import 'package:GoClassUnibe/providers/SignUpProvider.dart';
import 'package:GoClassUnibe/providers/StudentProvider.dart';
import 'package:GoClassUnibe/widgets/screens/homeApp/ChangeEmail2Screen.dart';
import 'package:GoClassUnibe/widgets/screens/homeApp/ChangeEmailScreen.dart';
import 'package:GoClassUnibe/widgets/screens/homeApp/HomeScreen.dart';
import 'package:GoClassUnibe/widgets/screens/homeApp/LoginScreen.dart';
import 'package:GoClassUnibe/widgets/screens/homeApp/ResetPassword2Screen.dart';
import 'package:GoClassUnibe/widgets/screens/homeApp/ResetPasswordScreen.dart';
import 'package:GoClassUnibe/widgets/screens/homeApp/SignUp.dart';
import 'package:GoClassUnibe/widgets/screens/homeApp/SignUp2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:GoClassUnibe/widgets/screens/mainApp/IndexScreen.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:provider/provider.dart';
import 'widgets/screens/homeApp/ChangePassword.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new UserPreferences();
  await prefs.initPrefs();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent
      //statusBarBrightness: Brightness.dark
      ));

  //runApp(MyApp());
  runApp(
    Phoenix(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    final prefs = new UserPreferences();
    //prefs.studentEmail = '';
    //print(prefs.studentID);
    //print(prefs.token);
    //print(prefs.studentEmail);
    //print(prefs.url);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => StudentProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => RatingProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => PeriodProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => RegistrationProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ScheduleProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => LoginProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => SignUpProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ResetPasswordProvider(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
            splashColor: Colors.transparent, primaryColor: colorAppSkyBlue),
        debugShowCheckedModeBanner: false,
        title: 'MyApp',
        initialRoute: (prefs.studentID == 0) ? 'homeScreen' : 'indexScreen',
        routes: {
          'signUpScreen': (BuildContext content) => SignUp(),
          'signUpScreen2': (BuildContext content) => SignUp2(),
          'loginScreen': (BuildContext context) => LoginScreen(),
          'homeScreen': (BuildContext context) => HomeScreen(),
          'indexScreen': (BuildContext context) => IndexScreen(),
          'resetPasswordScreen': (BuildContext context) =>
              ResetPasswordScreen(),
          'resetPasswordScreen2': (BuildContext context) =>
              ResetPassword2Screen(),
          'changePassword': (BuildContext context) => ChangePassword(),
          'changeEmail': (BuildContext context) => ChangeEmailScreen(),
          'changeEmail2': (BuildContext context) => ChangeEmail2Screen(),
        },
        //home: IndexScreen()
      ),
    );
  }
}
