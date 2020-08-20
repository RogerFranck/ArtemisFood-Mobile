import 'package:flutter/material.dart';

class MyClipper extends CustomClipper<Path> {
  
    @override
    Path getClip(Size size) {
      Path path = Path();

      path.lineTo(0.0, size.height * 0.55);
      path.quadraticBezierTo(size.width * .4 , size.height, size.width, size.height * 0.88);
      path.lineTo(size.width, 0.0);
      path.close();

      return path;
    }
  
    @override
    bool shouldReclip(CustomClipper<Path> oldClipper) => true;
  }