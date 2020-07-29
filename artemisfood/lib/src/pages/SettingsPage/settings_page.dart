import 'package:artemisfood/src/pages/HomePage/components/custom_app_bar.dart';
import 'package:artemisfood/src/static/const.dart';
import 'package:flutter/material.dart';
import 'components/settings_list_tile.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

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
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              SettingListTile(
                leadingIcon: Icons.person_outline,
                texto: 'Account',
                onTap: () {},
              ),
              SettingListTile(
                leadingIcon: Icons.notifications_none,
                texto: 'Notifications',
                onTap: () {},
              ),
              SettingListTile(
                leadingIcon: Icons.headset_mic,
                texto: 'Help and Support',
                onTap: () {},
              ),
              SettingListTile(
                leadingIcon: Icons.help_outline,
                texto: 'About',
                onTap: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}