import 'package:artemisfood/src/static/const.dart';
import 'package:flutter/material.dart';
import 'body_home.dart';

class BackgroundHome extends StatelessWidget {
  const BackgroundHome({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      //alignment: Alignment.center,
      children: <Widget>[
        ClipRRect(
         
          child: Container(
            width: double.infinity,
            height: 350.0,
            color: primaryColor,
          ),
        ),
        BodyHome(),
      ],
    );
  }
}