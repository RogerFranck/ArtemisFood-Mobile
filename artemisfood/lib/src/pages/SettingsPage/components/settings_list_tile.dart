import 'package:artemisfood/src/providers/app_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    final appBloc = Provider.of<AppBloc>(context, listen: false);
    
    return FractionallySizedBox(
      widthFactor: 0.9,
      child: Column(
        children: <Widget>[
          ListTile(
            leading: icon,
            title: Text(
              texto,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w500
              ),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: appBloc.isDarkMode ? Colors.white : Colors.black,
              size: 30.0
            ),
            onTap: onTap,
          ),
          FractionallySizedBox(
            widthFactor: 0.9,
            child: Divider(
              color: appBloc.isDarkMode ? Colors.white :  Colors.black,
              height: 30.0,
            ),
          ),
        ],
      ),
    );
  }
}