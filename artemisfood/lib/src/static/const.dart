import 'package:flutter/material.dart';

Color primaryColor = Color(0xFF4525a4);
Color backgroundHome = Color(0xFFEFF2F7);
Color backgroundHomeDark = Color(0xFF353535);
TextStyle primaryStyle = TextStyle( fontWeight: FontWeight.bold, color: Colors.white, fontSize: 25.0 );
TextStyle primaryTitle = TextStyle( fontWeight: FontWeight.bold, fontSize: 20.0 );
TextStyle primarySubtitle = TextStyle( fontSize: 12.0 );
String imgPath = 'lib/assets/img';
String iconPath = 'lib/assets/icons';
double iconSize = 30;
Container loadingCircular = Container(
                  margin: EdgeInsets.only(top: 20.0),
                  child: Center(
                    child: CircularProgressIndicator()
                  ),
                );

String server = "https://artemisfoodapi.herokuapp.com";