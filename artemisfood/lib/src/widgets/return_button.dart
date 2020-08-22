import 'package:artemisfood/src/static/const.dart';
import 'package:flutter/material.dart';

class ReturnButton extends StatelessWidget {
  const ReturnButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      height: kToolbarHeight * 1.3,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(color: primaryColor, width: 0.4)
          ),
        ),
        child: Align(
          alignment: Alignment.center,
          child: InkWell(
            splashColor: Colors.transparent,
            onTap: () {
              Navigator.pop(context);
            },
            child: Text(
              'Regresar',
              style: TextStyle(color: primaryColor, fontSize: 18.0, fontWeight: FontWeight.w500 ),
            ),
          ),
        ),
      )
    );
  }
}