import 'package:artemisfood/src/static/const.dart';
import 'package:flutter/material.dart';

class HelpButton extends StatelessWidget {
  final String hintText;
  final Function onPressed;
  final Color color;
  
  const HelpButton({
    Key key, this.hintText, this.onPressed, this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120.0,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        onPressed: onPressed,
        color: primaryColor,
        child: Text(
          hintText.toUpperCase(),
          style: TextStyle(
            color: Colors.white
          ),
        ),
      ),
    );
  }
}