import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Auth extends StatefulWidget {
  Auth({Key key}) : super(key: key);

  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {

  SharedPreferences sharedPreferences;

  @override
  void initState() {
    super.initState();
    checkLoginEstatus();
  }

  checkLoginEstatus() async {
    sharedPreferences = await SharedPreferences.getInstance(); //Similar al localstorage
    if(sharedPreferences.getString("token") == null) {
      Navigator.pushNamed(
        context, 'login'
      );
    }else{
      Navigator.pushNamed(
        context, 'Home'
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Cargando..."),
      ),
    );
  }
}