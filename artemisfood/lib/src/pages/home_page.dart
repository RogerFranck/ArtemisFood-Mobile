import 'package:artemisfood/src/components/background_home.dart';
import 'package:artemisfood/src/pages/order.dart';
import 'package:artemisfood/src/pages/profile.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    BackgroundHome(),
    Order(),
    Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(17.0), topRight: Radius.circular(17.0)),
          child: BottomNavigationBar(
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
              backgroundColor: Colors.grey[200],
              iconSize: 30.0,
              unselectedItemColor: Colors.black,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  title: Container(),
                  backgroundColor: Colors.black,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.receipt),
                  title: Container(),
                  backgroundColor: Colors.black,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  title: Container(),
                  backgroundColor: Colors.black,
                ),
              ])),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}
