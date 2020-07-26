import 'package:artemisfood/src/static/const.dart';
import 'package:flutter/material.dart';

class TitleAppBar extends StatelessWidget {
  const TitleAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(
              'Artemis',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black,),
            ),
            Text(
              'Food',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: primaryColor,),
            ),
          ],
        ),
        CircleAvatar(
          radius: 20.0,
          backgroundColor: Colors.black87,
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications,
              color: Colors.yellow,
            ),
          ),
        ),
      ],
    );
  }
}