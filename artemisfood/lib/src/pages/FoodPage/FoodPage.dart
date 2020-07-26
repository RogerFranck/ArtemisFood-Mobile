import 'package:artemisfood/src/static/const.dart';
import 'package:flutter/material.dart';

class FoodPage extends StatelessWidget {
  const FoodPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundHome,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.0), bottomRight: Radius.circular(20.0)),
              child: Container(
                width: double.infinity,
                height: 250.0,
                decoration: BoxDecoration(
                  color: Colors.amber
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 1.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: Colors.white
                  ),
                ),
              ),
            ),
             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 1.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: Colors.white
                  ),
                ),
              ),
            ),
             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 1.0,
                  height: 150.0,
                  decoration: BoxDecoration(
                    color: Colors.white
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}