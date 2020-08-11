import 'package:artemisfood/src/providers/app_bloc.dart';
import 'package:artemisfood/src/static/const.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomSwitchListTile extends StatelessWidget {
  final String title;
  final String icon;
  final ValueChanged onChanged;
  const CustomSwitchListTile({
    Key key, 
    this.title, 
    this.icon, 
    this.onChanged,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final appBloc = Provider.of<AppBloc>(context, listen: false);
    final double size = 30;

    return Padding(
      padding: const EdgeInsets.only(top:  20.0),
      child: Column(
        children: [
          SwitchListTile(
            value: appBloc.isDarkMode,
            onChanged: onChanged,
            activeColor: primaryColor,
            title: Row(
              children: [
                Image.asset(
                  icon,
                  height: size,
                  width: size,
                  color: appBloc.isDarkMode ? Colors.white : Colors.black,
                ),
                SizedBox(
                  width: 20.0,
                ),
                Text(
                  title,
                  style: TextStyle(
                    color: appBloc.isDarkMode ? Colors.white : Colors.black,
                    fontSize: 20.0
                  ),
                ),
              ],
            ),
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