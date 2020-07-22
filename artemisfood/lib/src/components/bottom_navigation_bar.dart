import 'package:flutter/material.dart';

class NavigationBar extends StatelessWidget {
  const NavigationBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25.0),
      child: Container(
        height: 85.0,
        child: BottomNavigationBar(
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black,
          iconSize: 30.0,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              title: Container(),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.receipt
              ),
              title: Container()
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person
              ),
              title: Container(),
            )
          ],
        ),
      ),
    );
  }
}