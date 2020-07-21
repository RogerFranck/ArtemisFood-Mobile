import 'dart:html';
import 'package:artemisfood/src/components/background_home.dart';
import 'package:artemisfood/src/components/body_home.dart';
import 'package:artemisfood/src/components/bottom_navigation_bar.dart';
import 'package:artemisfood/src/static/const.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: NavigationBarBottom()
      ),
      backgroundColor: backgroundHome,
      body: BodyHome(),
    );
  }
}

