import 'package:artemisfood/src/components/custom_bottom_body.dart';
import 'package:artemisfood/src/pages/HomePage/components/custom_app_bar.dart';
import 'package:artemisfood/src/providers/app_bloc.dart';
import 'package:artemisfood/src/static/const.dart';
import 'package:artemisfood/src/widgets/return_button.dart';
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
      body: CustomScrollView(
        slivers: [
          CustomAppBar(
            bottomBody: CustomBottomBody(
              title: 'Appearance',
            ),
          ),
          SliverFillRemaining(
            child: Stack(
              fit: StackFit.expand,
              children: [
                ListView(
                  padding: EdgeInsets.all(0),
                  children: [
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
                    ),
                  ],
                ),
                ReturnButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}