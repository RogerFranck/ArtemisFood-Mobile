import 'package:flutter/material.dart';

class ImageFood extends StatelessWidget {
  final String imagen;
  const ImageFood({
    Key key, this.imagen,
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
          image: NetworkImage(imagen)
        ),
      ),
    );
  }
}
