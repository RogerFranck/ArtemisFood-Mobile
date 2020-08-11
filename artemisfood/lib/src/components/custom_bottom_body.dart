import 'package:artemisfood/src/static/const.dart';
import 'package:flutter/material.dart';

class CustomBottomBody extends StatelessWidget {
  final String title;
  const CustomBottomBody({
    Key key, @required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Text(
        title,
        style: TextStyle(
          color: primaryColor,
          fontWeight: FontWeight.bold,
          fontSize: 22.0
        ),
      ),
    );
  }
}