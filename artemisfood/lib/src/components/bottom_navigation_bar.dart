import 'package:flutter/material.dart';

class NavigationBarBottom extends StatelessWidget {
  const NavigationBarBottom({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(topLeft: Radius.circular(40.0), topRight: Radius.circular(40.0)),
      child: Container(
        height: 90.0,
        child: BottomNavigationBar(
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black,
          backgroundColor: Colors.white,
          iconSize: 40.0,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home
              ),
              title: Container(),
              backgroundColor: Colors.black,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart
              ),
              title: Container(),
              backgroundColor: Colors.black,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person
              ),
              title: Container(),
              backgroundColor: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}