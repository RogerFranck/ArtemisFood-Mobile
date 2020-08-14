import 'package:flutter/material.dart';

class ImageFood extends StatelessWidget {
  final String imagen;
  final Object hero;
  const ImageFood({
    Key key, this.imagen, @required this.hero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15.0), bottomRight: Radius.circular(15.0)),
      child: Hero(
        tag: hero,
        child: Container(
          width: double.infinity,
          height: 250.0,
          child: Image(
            fit: BoxFit.cover,
            image: NetworkImage(imagen)
          ),
        ),
      ),
    );
  }
}
