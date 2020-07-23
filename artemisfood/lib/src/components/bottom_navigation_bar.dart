import 'package:flutter/material.dart';

class NavigationBarBottom extends StatefulWidget {
  const NavigationBarBottom({
    Key key,
  }) : super(key: key);

  @override
  _NavigationBarBottomState createState() => _NavigationBarBottomState();
}

class _NavigationBarBottomState extends State<NavigationBarBottom> {

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(topLeft: Radius.circular(40.0), topRight: Radius.circular(40.0)),
      child: Container(
        height: 90.0,
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black,
          backgroundColor: Colors.white,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
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