import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String hintText;
  final Function onPress;
  const RoundedButton({Key key, this.hintText, this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final radius = BorderRadius.circular(20.0);

    return Container(
        width: size.width * 0.70,
        margin: EdgeInsets.only( top: 25.0 ),
        decoration: BoxDecoration(
          borderRadius: radius,
          color: Color(0xFF4525a4)
        ),
        child: FlatButton(
          hoverColor: Colors.pink,
          autofocus: true,
          clipBehavior: Clip.antiAlias,
          onPressed: onPress ,
          shape: RoundedRectangleBorder(
            borderRadius: radius,
          ),
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