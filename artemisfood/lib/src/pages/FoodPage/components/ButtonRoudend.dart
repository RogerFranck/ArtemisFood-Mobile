import 'package:flutter/material.dart';

class ButtonRoundend extends StatelessWidget {
  final String hintText;
  final Function onPress;
  const ButtonRoundend({Key key, this.hintText, this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        width: size.width * 0.80,
        margin: EdgeInsets.only( top: 25.0 ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Color(0xFF4525a4)
        ),
        child: FlatButton(
          onPressed: onPress ,
          child: Text(
            hintText,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white
            ),
          ),
        ),
    );
  }
}