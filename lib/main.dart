import 'package:GoClassUnibe/widgets/screens/homeApp/FirstHome.dart';
import 'package:GoClassUnibe/widgets/screens/homeApp/HomeScreen.dart';
import 'package:GoClassUnibe/widgets/screens/homeApp/LoginScreen.dart';
import 'package:GoClassUnibe/widgets/screens/homeApp/SingUp.dart';
import 'package:GoClassUnibe/widgets/screens/homeApp/Validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:GoClassUnibe/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:GoClassUnibe/widgets/screens/homeApp/home.dart';

//import 'package:GoClassUnibe/widgets/screens/homeApp/FirstHome.dart';
import 'package:GoClassUnibe/widgets/screens/mainApp/IndexScreen.dart';
//import 'package:GoClassUnibe/constants/Colors.dart';

void main() => runApp(App());

class App extends StatefulWidget {
  App({Key key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthService.instance(),
      child: MaterialApp(
          initialRoute: '/',
          routes: {
            // Rutas
          },
          debugShowCheckedModeBanner: false,
          title: 'Firebase Auth con Provider',
          home: Consumer(
            builder: (context, AuthService authService, _) {
              switch (authService.status) {
                case AuthStatus.Uninitialized:
                  return Text('Cargando');
                case AuthStatus.Authenticated:
                  return Home();
                case AuthStatus.Authenticating:
                  return SignUp();
                case AuthStatus.Unauthenticated:
                  return SignUp();
              }
              return null;
            },
          )),
    );
  }
}
/*void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, title: '', home: ValidationScreen());
    //debugShowCheckedModeBanner: false,
    //title: 'MyApp',
    //home: IndexScreen());
  }


}*/
