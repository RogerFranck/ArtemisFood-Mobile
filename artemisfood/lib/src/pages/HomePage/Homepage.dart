import 'package:artemisfood/src/pages/CartPage/cartPage.dart';
import 'package:artemisfood/src/pages/CartPage/components/cartpage2.dart';
import 'package:artemisfood/src/pages/SettingsPage/settings_page.dart';
import 'package:artemisfood/src/static/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'components/body.dart';

class HomePage extends StatefulWidget {

  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

int currentIndex = 0;

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    currentIndex = 0;
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: backgroundHome,
      body: _paginaActual(currentIndex),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0),),
        child: Container(
          height: 65,
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            currentIndex: currentIndex,
            iconSize: 35.0,
            unselectedItemColor: Colors.black,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home
                ),
                title: Container(),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.receipt
                ),
                title: Container(),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person
                ),
                title: Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _paginaActual(int paginaActual) {
    switch (paginaActual) {
      case 0: return BodyHome();
      case 1: return CartPage2();
      case 2: return SettingsPage();
        
      default:
        return BodyHome();
    }
  }

}





