import 'package:artemisfood/src/providers/app_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PriceFood extends StatelessWidget {
  final int precio;
  const PriceFood({
    Key key, this.precio,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appBloc = Provider.of<AppBloc>(context, listen: false);
    return Padding(
      padding: EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0 ),
      //padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Container(
          width: MediaQuery.of(context).size.width * 1.0,
          height: 60.0,
          decoration: BoxDecoration(
             color: appBloc.isDarkMode ? Colors.white.withOpacity(0.85) : Colors.white
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.local_atm,size: 35.0,),
              SizedBox(width: 10.0),
              Text(
                "${precio.toDouble()} MXN", 
                style: TextStyle(
                  fontSize: 25.0,
                ),
              )
            ],
          ),
        ),
        ),
      );
  }
}

