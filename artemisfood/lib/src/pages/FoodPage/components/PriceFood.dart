import 'package:flutter/material.dart';

class PriceFood extends StatelessWidget {
  const PriceFood({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0 ),
      //padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Container(
          width: MediaQuery.of(context).size.width * 1.0,
          height: 60.0,
          decoration: BoxDecoration(
            color: Colors.white
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.local_atm,size: 35.0,),
              SizedBox(width: 10.0),
              Text(
                "100 MXN", 
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

