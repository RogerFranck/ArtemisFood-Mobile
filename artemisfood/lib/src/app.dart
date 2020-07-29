import 'package:artemisfood/src/pages/FoodPage/FoodPage.dart';
import 'package:artemisfood/src/pages/HomePage/Homepage.dart';
import 'package:artemisfood/src/pages/Login.dart';
import 'package:artemisfood/src/pages/sign_up.dart';
import 'package:artemisfood/src/static/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    FlutterStatusbarcolor.setStatusBarColor(Colors.black);
    FlutterStatusbarcolor.setNavigationBarColor(Colors.white);
    return MaterialApp(
      initialRoute: 'Home',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: Login(),
      routes: {
        'login'   :     (BuildContext context) => Login(),
        'Sign_up'   :     (BuildContext context) => SignUp(),
        'Home'   :     (BuildContext context) => HomePage(),
        'Food' :  (BuildContext context) => FoodPage(),
      },
    );
  }
}