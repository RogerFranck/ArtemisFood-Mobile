import 'package:artemisfood/src/pages/HomePage/components/custom_app_bar.dart';
import 'package:artemisfood/src/providers/dark_mode.dart';
import 'package:artemisfood/src/static/const.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'components/settings_list_tile.dart';

class SettingsPage extends StatelessWidget {
  
  const SettingsPage({Key key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    final double size = 30;
    SharedPreferences sharedPreferences;
    final appBloc = Provider.of<AppBloc>(context, listen: false);
    return CustomScrollView(
      slivers: <Widget>[
        CustomAppBar(
          bottomBody: Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: Text(
              'Settings',
              style: TextStyle(
                color: primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 22.0
              ),
            ),
          )
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            <Widget>[
              FractionallySizedBox(
                widthFactor: 0.7,
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 35.0),
                  alignment: Alignment.center,
                  child: Text(
                    'Miguel Antonio Fuentes',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20.0,
                      color: appBloc.isDarkMode ? Colors.white :  Colors.black
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              SettingListTile(
                icon: Image(
                  image: AssetImage('$iconPath/user_settings.png'),
                  height: size,
                  width: size,
                  color: appBloc.isDarkMode ? Colors.white :  Colors.black,
                ),
                texto: 'Account',
                onTap: () {},
              ),
              SettingListTile(
                icon: Image(
                  image: AssetImage('$iconPath/notification_regular.png'),
                  height: size,
                  width: size,
                  color: appBloc.isDarkMode ? Colors.white :  Colors.black,
                ),
                texto: 'Notifications',
                onTap: () {},
              ),
              SettingListTile(
                icon: Image(
                  image: AssetImage('$iconPath/help_support.png'),
                  height: size,
                  width: size,
                  color: appBloc.isDarkMode ? Colors.white :  Colors.black,
                ),
                texto: 'Help and Support',
                onTap: () {},
              ),
              SettingListTile(
               icon: Image(
                  image: AssetImage('$iconPath/about.png'),
                  height: size,
                  width: size,
                  color: appBloc.isDarkMode ? Colors.white :  Colors.black,
                ),
                texto: 'About',
                onTap: () {},
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Weeeyyyy noooo... Daark mooode',
                    style: TextStyle(
                      color: appBloc.isDarkMode ? Colors.white : Colors.black
                    ),
                  ),
                  Switch(
                    value: appBloc.isDarkMode,
                    onChanged: (val) {
                      appBloc.onThemeUpdated(val);
                    },
                  )
                ],
              ),
              FractionallySizedBox(
                widthFactor: 0.6,
                child: Container(
                  margin: EdgeInsets.only( top: 25.0 ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.red[900]
                  ),
                  child: FlatButton(
                    onPressed: () async {
                      sharedPreferences = await SharedPreferences.getInstance();
                      sharedPreferences.remove("token");
                      Navigator.pushReplacementNamed(
                        context, 'login'
                      );
                    } ,
                    child: Text(
                      "Close Session",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}