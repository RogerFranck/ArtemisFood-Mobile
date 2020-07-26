import 'package:flutter/material.dart';

class TextButton extends StatelessWidget {
  final String hintText;
  final Function onPress;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  const TextButton({Key key, this.hintText, this.onPress, this.color = const Color(0xFF4525a4), this.fontSize = 13.0, this.fontWeight = FontWeight.normal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlatButton(
        splashColor: Colors.transparent,
        onPressed: onPress,
        child: Text(
          hintText,
          style: TextStyle(
            color: color,
            fontWeight: fontWeight,
            fontSize: fontSize,
          ),
          )
      ),
    );
  }
}