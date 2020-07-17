import 'package:flutter/material.dart';

class TextButton extends StatelessWidget {
  final String hintText;
  final Function onPress;
  const TextButton({Key key, this.hintText, this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlatButton(
        onPressed: onPress,
        child: Text(
          hintText,
          style: TextStyle(
            color: Color(0xFF4525a4)
          ),
          )
      ),
    );
  }
}