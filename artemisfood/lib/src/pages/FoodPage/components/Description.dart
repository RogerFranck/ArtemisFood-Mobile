import 'package:artemisfood/src/providers/app_bloc.dart';
import 'package:artemisfood/src/static/const.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Description extends StatelessWidget {
  const Description({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appBloc = Provider.of<AppBloc>(context, listen: false);
    return Padding(
      //padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Container(
          width: MediaQuery.of(context).size.width * 1.0,
          height: 150.0,
          decoration: BoxDecoration(color: appBloc.isDarkMode ? Colors.white.withOpacity(0.85) : Colors.white),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Hambuerguesa",
                        style: TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            fontFamily: "Avenir"),
                      ),
                      Icon(Icons.star_border)
                    ],
                  ),
                  SizedBox(height: 12.0),
                  Text(
          "Lorem Ipsum is simply dummy text of the printing and typesettingtly with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}