import 'package:artemisfood/src/static/const.dart';
import 'package:artemisfood/src/widgets/return_button.dart';
import 'package:flutter/material.dart';

class SinNotificaciones extends StatelessWidget {
  const SinNotificaciones({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Orientation orientation = MediaQuery.of(context).orientation; //landscape, portrait
    final double paddingBottom =  MediaQuery.of(context).size.height * 0.15;

    return SliverFillRemaining(
      child: Stack(
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: paddingBottom),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FractionallySizedBox(
                    widthFactor: orientation == Orientation.portrait ? .5 : .2,
                    child: Image.asset(
                      '$iconPath/notifications_off.png',
                      color: Colors.blueGrey,
                    ),
                  ),
                  SizedBox(height: 5.0,),
                  Text(
                    'Aún no tienes notificationes...',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 18.0
                    ),
                  )
                ],
              ),
            ),
          ),
          ReturnButton()
        ],
      ),
    );
  }
}