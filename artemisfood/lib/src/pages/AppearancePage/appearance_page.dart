import 'package:artemisfood/src/components/RoundedButton.dart';
import 'package:artemisfood/src/components/custom_bottom_body.dart';
import 'package:artemisfood/src/pages/HomePage/components/custom_app_bar.dart';
import 'package:artemisfood/src/providers/app_bloc.dart';
import 'package:artemisfood/src/static/const.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/custom_switch_list_tile.dart';

class AppearancePage extends StatelessWidget {
  const AppearancePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appBloc = Provider.of<AppBloc>(context, listen: false);
    final _color =  appBloc.isDarkMode ? backgroundHomeDark : backgroundHome;

    return Scaffold(
      backgroundColor: _color,
      bottomSheet: DecoratedBox(
        decoration: BoxDecoration(
          color: _color,
          border: Border(
            top: BorderSide(
              color: _color,
              width: 0.0
            ),
          ),
        ),
        child: FractionallySizedBox(
          widthFactor: 1,
          child: Padding(
            padding: EdgeInsets.only(bottom: 20.0),
            child: FractionallySizedBox(
              widthFactor: 0.6,
              child: RoundedButton(
                hintText: 'Regresar', 
                onPress: () {
                  Navigator.pop(context);
                }
              ,),
            ),
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          CustomAppBar(
            bottomBody: CustomBottomBody(
              title: 'Appearance',
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                FractionallySizedBox(
                  widthFactor: 0.9,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      CustomSwitchListTile(
                        icon: '$iconPath/dark_mode.png',
                        title: 'Dark Mode',
                        onChanged: (val) {
                          appBloc.onThemeUpdated(val);
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}