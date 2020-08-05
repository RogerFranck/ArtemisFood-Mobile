import 'package:flutter/material.dart';
//Aqui es el contenido del text field (ícono, placeholder, etc), seh

class RoundedInputField extends StatelessWidget {
  //final Widget child;
  final ValueChanged<String> onChanged;
  final IconData icon;
  final bool passtype;
  final String hintText;
  const RoundedInputField({Key key, this.onChanged, this.icon, this.hintText, this.passtype=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: passtype,
      onChanged: onChanged,
      decoration: InputDecoration(
        icon: Icon( icon, color: Colors.black, size: 30.0 ),
        hintText: hintText,
        border: InputBorder.none,
      ),
    );
  }
}
