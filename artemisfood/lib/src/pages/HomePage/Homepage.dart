import 'package:artemisfood/src/pages/CartPage/cartPage.dart';
import 'package:artemisfood/src/pages/SettingsPage/settings_page.dart';
import 'package:artemisfood/src/providers/app_bloc.dart';
import 'package:artemisfood/src/static/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'components/body.dart';

class HomePage extends StatefulWidget {

  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

int currentIndex = 0;
List<bool> selectedIndex = [true, false, false];

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    currentIndex = 0;
  }
  
  @override
  Widget build(BuildContext context) {
    final appBloc = Provider.of<AppBloc>(context, listen: false);
    return Scaffold(
      backgroundColor: appBloc.isDarkMode ? backgroundHomeDark : backgroundHome,
      body: _paginaActual(currentIndex),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0),),
        child: Container(
          height: 65,
          child: BottomNavigationBar(
            backgroundColor: appBloc.isDarkMode ? Colors.black : Colors.white,
            onTap: (index) {
              setState(() {
                currentIndex = index;
                for (var i = 0; i < selectedIndex.length; i++) {
                  if (i == currentIndex) {
                    selectedIndex[i] = true;
                  } else {
                    selectedIndex[i] = false;
                  }
                }
              });
            },
            currentIndex: currentIndex,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Image(
                  image: AssetImage('$iconPath/home_icon.png'),
                  color: selectedIndex[0] ? primaryColor : appBloc.isDarkMode ? Colors.white : Colors.black,
                  width: 24,
                  height: 24,
                ),
                title: Container(),
              ),
              BottomNavigationBarItem(
                icon: Image(
                  image: AssetImage('$iconPath/receipt.png'),
                  color: selectedIndex[1] ? primaryColor : appBloc.isDarkMode ? Colors.white : Colors.black,
                  width: 24,
                  height: 24,
                ),
                title: Container(),
              ),
              BottomNavigationBarItem(
                icon: Image(
                  image: AssetImage('$iconPath/user.png'),
                  color: selectedIndex[2] ? primaryColor : appBloc.isDarkMode ? Colors.white : Colors.black,
                  width: 24,
                  height: 24,
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
      case 1: return CartPage();
      case 2: return SettingsPage();
        
      default:
        return BodyHome();
    }
  }

}





