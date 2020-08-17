import 'package:artemisfood/src/providers/app_bloc.dart';
import 'package:artemisfood/src/static/const.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TitleAppBar extends StatelessWidget {
  const TitleAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appBloc = Provider.of<AppBloc>(context, listen: false);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: 'Artemis',
                style: TextStyle(fontSize: 20.0, color: appBloc.isDarkMode ? Colors.white : Colors.black),
              ),
              TextSpan(
                text: 'Food',
                style: TextStyle(fontSize: 20.0, color: primaryColor,),
              ),
            ],
          ),
        ),
        CircleAvatar(
          radius: 20.0,
          backgroundColor: Color(0xFFFF334D5C),
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