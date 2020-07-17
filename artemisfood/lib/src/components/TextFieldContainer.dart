import 'package:flutter/material.dart';

//Toca crear el text field, por el momento es stateless, stateful es cuando ya queramos recibir el valor que puso

class TextFieldContainer extends StatelessWidget {
  final Widget child; //Esta clase debe recibir un hijo
  const TextFieldContainer({Key key, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.8,
      margin: EdgeInsets.only( top: 25.0 ),
      padding: EdgeInsets.symmetric( vertical: 5.0, horizontal: 20.0 ),
      decoration: BoxDecoration(
        color: Color(0xFFF4EFF0), //Sip, debería de estirarse hacia abajo
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: child,
    );
  }
}
