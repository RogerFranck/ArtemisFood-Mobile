import 'package:artemisfood/src/static/const.dart';
import 'package:artemisfood/src/widgets/semiCircle_clipper.dart';
import 'package:flutter/material.dart';
import 'main_clipper.dart';

class TopBackground extends StatelessWidget {
  const TopBackground({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FractionallySizedBox(
          widthFactor: 1,
          child: ClipPath(
            clipper: MyClipper(),
            child: Container(
              alignment: Alignment.centerRight,
              height: MediaQuery.of(context).size.height * 0.42,
              color: primaryColor,
              child: Padding(
                padding: EdgeInsets.only(right: 45.0),
                child: Text(
                  'Artemis \n     Food', style: TextStyle(fontSize: 40.0, color: Colors.white, fontWeight: FontWeight.w700),
                ),
              )
            ),
          ),
        ),
         Positioned(
           bottom: 0,
           child: ClipPath(
             clipper: MyClipper2(),
             child: Container(
               width: MediaQuery.of(context).size.width * 0.25,
              height: 100.0,
              color: primaryColor,
            ),
           ),
         ),
      ],
    );
  }
}