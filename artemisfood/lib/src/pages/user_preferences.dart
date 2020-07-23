import 'package:artemisfood/src/static/const.dart';
import 'package:artemisfood/src/static/settingsItem.dart';
import 'package:flutter/material.dart';

class UserPreferencesBackground extends StatelessWidget {
  final Widget child;
  const UserPreferencesBackground({Key key, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(25.0)),
                child: Container(
                  width: size.width,
                  height: size.height * 0.15,
                  color: primaryColor,
                ),
              ),
              SafeArea(
                child: Text(
                  'Settings',
                  style: primaryStyle,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15.0,
          ),
          child,
        ],
      ),
    );
  }
}

class SettingsBody extends StatelessWidget {
  
  const SettingsBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     final Size size = MediaQuery.of(context).size;

    return UserPreferencesBackground(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SettingsTitle(),
            SettingsItem(
              icon: Icons.person,
              texto: 'Cuenta',
              onTap: () {},
            ),
            SettingsItem(
              icon: Icons.settings,
              texto: 'Opciones',
              onTap: () {},
            ),
            SettingsItem(
              icon: Icons.notifications,
              texto: 'Notificaciones',
              onTap: () {},
            ),
            SettingsItem(
              icon: Icons.visibility,
              texto: 'Apariencia',
              onTap: () {},
            ),
            SettingsItem(
              icon: Icons.lock,
              texto: 'Seguridad y privacidad',
              onTap: () {},
            ),
            SettingsItem(
              icon: Icons.headset,
              texto: 'Ayuda y soporte',
              onTap: () {},
            ),
            SettingsItem(
              icon: Icons.help_outline,
              texto: 'Acerca de nosotros',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsItem extends StatelessWidget {
  final IconData icon;
  final String texto;
  final Function onTap;
  final double size;
  
  const SettingsItem({
    Key key, 
    @required this.icon, 
    @required this.texto, 
    @required this.onTap,
    this.size = 30.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 0.2,
            color: Colors.grey
          ),
        ),
      ),
      margin: EdgeInsets.only(top: 10.0,),
      child: ListTile(
        onTap: onTap,
        leading: Icon(
          icon,
          size: size,
        ),
        title: Text(
          texto,
          style: TextStyle( fontWeight: FontWeight.bold, fontSize: 20.0 ),
        ),
        trailing: Icon(
          Icons.keyboard_arrow_right,
        ),
      ),
    );
  }
}

class SettingsTitle extends StatelessWidget {
  const SettingsTitle({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 0.2,
            color: Colors.grey,
          ),
        ),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.fromLTRB(30, 10, 0, 10),
        leading: CircleAvatar(
          radius: 30.0,
          backgroundColor: Colors.amber,
        ),
        title: Container(
          margin: EdgeInsets.only(left: 30.0,),
          child: Text(
            'Miguel Antonio Fuentes',
            style: TextStyle( fontWeight: FontWeight.bold, fontSize: 20.0 ),
          ),
        ),
      ),
    );
  }
}