import 'package:artemisfood/src/components/body_home.dart';
import 'package:artemisfood/src/pages/cart_page.dart';
import 'package:artemisfood/src/pages/user_preferences.dart';
import 'package:artemisfood/src/static/const.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

int currentIndex = 0;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundHome,
      body: _paginaActual(currentIndex),
      bottomNavigationBar: ClipRRect(
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
      ),
    );
  }

  Widget _paginaActual( int pagina ) {

    switch( pagina ) {
      
      case 0: return BodyHome();

      case 1: return CartPage();

      case 2: return UserPreferencesPage();

      default:
        return HomePage();

    }
  }


}

