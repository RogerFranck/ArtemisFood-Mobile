import 'package:flutter/material.dart';

class BordeSeparador extends StatelessWidget {
  const BordeSeparador({
    Key key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 25.0, left: 25.0, top: 15.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 0.5,
        )
      ),
    );
  }
}