import 'package:artemisfood/src/static/const.dart';
import 'package:flutter/material.dart';

class SettingListTile extends StatelessWidget {
  final String texto;
  final Widget icon;
  final Function onTap;
  const SettingListTile({
    Key key, 
    this.texto, 
    this.icon, 
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.9,
      child: Column(
        children: <Widget>[
          ListTile(
            leading: icon,
            title: Text(
              texto,
              style: TextStyle(
                color: primaryColor,
                fontWeight: FontWeight.w400,
                fontSize: 20.0
              ),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
              size: 30.0
            ),
            onTap: onTap,
          ),
          FractionallySizedBox(
            widthFactor: 0.9,
            child: Divider(
              color: Colors.black,
              height: 30.0,
            ),
          ),
        ],
      ),
    );
  }
}