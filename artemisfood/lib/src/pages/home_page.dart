import 'package:artemisfood/src/components/background_home.dart';
import 'package:artemisfood/src/static/const.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundHome(),
    );
  }
}

