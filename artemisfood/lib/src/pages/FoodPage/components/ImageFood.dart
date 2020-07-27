import 'package:flutter/material.dart';

class ImageFood extends StatelessWidget {
  const ImageFood({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15.0), bottomRight: Radius.circular(15.0)),
      child: Container(
        width: double.infinity,
        height: 250.0,
        child: Image(
          fit: BoxFit.cover,
          image: NetworkImage('https://s2.best-wallpaper.net/wallpaper/2880x1800/1808/Hamburger-meat-French-fries-fast-food_2880x1800.jpg')
        ),
      ),
    );
  }
}
