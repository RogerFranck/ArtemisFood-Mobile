import 'package:artemisfood/src/static/const.dart';
import 'package:flutter/material.dart';
import 'body_home.dart';

class BackgroundHome extends StatelessWidget {
  final Widget child;
  const BackgroundHome({
    Key key, 
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        //alignment: Alignment.center,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.only( bottomLeft: Radius.circular(30.0), bottomRight: Radius.circular(30.0) ),
            child: Container(
              width: double.infinity,
              height: 350.0,
              color: primaryColor,
            ),
          ),
          child,
        ],
      ),
    );
  }
}