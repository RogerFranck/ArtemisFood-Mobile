import 'package:artemisfood/src/static/const.dart';
import 'package:artemisfood/src/widgets/semiCircle_clipper.dart';
import 'package:flutter/material.dart';
import 'main_clipper.dart';

class TopBackground extends StatelessWidget {
  const TopBackground({
    Key key, @required this.containerHeight,
  }) : super(key: key);

  final double containerHeight;

  @override
  Widget build(BuildContext context) {
    final double _semiCircleSize = 140;
    double _topContainerHeight = containerHeight;

    return Stack(
      children: [
        Positioned(
          top: 0,
          right: 0,
          left: 0,
          child: ClipPath(
            clipper: MyClipper(),
            child: Container(
              alignment: Alignment.centerRight,
              height: _topContainerHeight,
              color: primaryColor,
              // child: Padding(
              //   padding: EdgeInsets.only(right: 45.0),
              //   child: Text(
              //     'Artemis \n     Food',
              //     style: TextStyle(
              //         fontSize: 40.0,
              //         color: Colors.white,
              //         fontWeight: FontWeight.w700),
              //   ),
              // )
            ),
          ),
        ),
        Positioned(
          top: _topContainerHeight / 3,
          right: 40,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Artemis',
                style: TextStyle(
                  fontSize: 40.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'Food',
                style: TextStyle(
                  fontSize: 40.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              )
            ],
          ),
        ),
        Positioned(
          left: -_semiCircleSize * .65,
          top: _topContainerHeight - 125,
          child: ClipOval(
            //  clipper: MyClipper2(),
            child: Container(
              width: _semiCircleSize - 5,
              height: _semiCircleSize,
              color: primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
