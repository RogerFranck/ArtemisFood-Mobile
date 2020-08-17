import 'package:flutter/material.dart';
import 'package:artemisfood/src/static/const.dart';

class RoundedInputField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final IconData icon;
  final bool passtype;
  final String hintText;
  const RoundedInputField({Key key, this.onChanged, this.icon, this.hintText, this.passtype=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: passtype,
      style: textFieldStyle,
      onChanged: onChanged,
      decoration: InputDecoration(
        icon: Icon( icon, color: Colors.black, size: 30.0 ),
        hintText: hintText,
        border: InputBorder.none,
        hintStyle: TextStyle(color: Colors.grey)
      ),
    );
  }
}
