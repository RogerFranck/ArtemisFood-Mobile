import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Auth extends StatefulWidget {
  Auth({Key key}) : super(key: key);

  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> with SingleTickerProviderStateMixin {

  SharedPreferences sharedPreferences;
  int seconds = 1;
  AnimationController controller;
  Animation<double> opacidad;

  @override
  void initState() {
    controller =  AnimationController(vsync: this, duration: Duration(seconds: seconds));
    opacidad = Tween(begin: 1.0, end: 0.7).animate(controller);
    controller.forward();
    super.initState();
    checkLoginEstatus().then((token) {
      if (token) {
        Navigator.pushReplacementNamed(
          context, 
          'Home',
        );
      } else {
        Navigator.pushReplacementNamed(
          context, 
          'Home',
        );
      }
    });
  }

  @override
  void dispose() { 
    controller.dispose();
    super.dispose();
  }

  Future<bool> checkLoginEstatus() async {
    await Future.delayed(Duration(seconds: seconds), () {});
    sharedPreferences = await SharedPreferences.getInstance(); //Similar al localstorage
    if(sharedPreferences.getString("token") == null) {

      return false;
    }else{

      return true;
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: opacidad,
      child: PantallaCarga()
    );
  }
}

class PantallaCarga extends StatelessWidget {
  const PantallaCarga({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: <Color>[
              Color(0XFFFF4527A0),
              Color(0XFFFF4527A0).withOpacity(0.6)
            ],
          )
        ),
        child: Center(
          child: FractionallySizedBox(
            widthFactor: .5,
            heightFactor: .5,
            child: Image(
              image: AssetImage('lib/assets/img/space_dinosaur.png'),
            ),
          ),
        ),
      ),
    );
  }
}