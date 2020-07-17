import 'package:artemisfood/src/pages/Login.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF4527A0),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: Login()
    );
  }
}