import 'package:artemisfood/src/components/RoundedButton.dart';
import 'package:artemisfood/src/components/custom_bottom_body.dart';
import 'package:artemisfood/src/pages/HomePage/components/custom_app_bar.dart';
import 'package:artemisfood/src/providers/app_bloc.dart';
import 'package:artemisfood/src/static/const.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appBloc = Provider.of<AppBloc>(context, listen: false);
    double size = 20.0;
    final Orientation orientation = MediaQuery.of(context).orientation;
    
    return Scaffold(
      backgroundColor: appBloc.isDarkMode ? backgroundHomeDark : backgroundHome,
      body: CustomScrollView(
        slivers: [
          CustomAppBar(
            bottomBody: CustomBottomBody(title: 'Account'),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical : 25.0),
                  child: Column(
                    children: [
                      AccountCard(
                        img: '$imgPath/history.png',
                        title: 'Tu Historia Con Nosotros',
                        icon: '$iconPath/receipt.png',
                        onTap: () {},
                      ),
                      AccountCard(
                        img: '$imgPath/comida.jpg',
                        title: 'Tus Favoritos',
                        icon: '$iconPath/love_bubble.png',
                        onTap: () {},
                        margin: false,
                      ),
                      FractionallySizedBox(
                        widthFactor: orientation == Orientation.portrait ? 0.6 : 0.4,
                        child: RoundedButton(
                          hintText: 'Regresar',
                          onPress: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ]
            ),
          )
        ],
      ),
    );
  }
}

class AccountCard extends StatelessWidget {
  final String icon; 
  final String title;
  final String img;
  final Function onTap;
  final bool margin;
  const AccountCard({
    Key key, this.icon, this.title, this.img, this.onTap, this.margin = true,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final appBloc = Provider.of<AppBloc>(context, listen: false);
    double _size = 20.0;
    final Orientation orientation = MediaQuery.of(context).orientation;

    return FractionallySizedBox(
      widthFactor: orientation == Orientation.portrait ? 0.9 : 0.75,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: margin ? EdgeInsets.only(bottom: 20.0) : null,
          height: 250.0,
          decoration: BoxDecoration(
            border: appBloc.isDarkMode ? null : Border.all(width: .1),
            borderRadius: BorderRadius.circular(20.0),
            image: DecorationImage(
              image: AssetImage(img),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop)
            )
          ),
          child: Align(
            alignment: Alignment(0, .75),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: appBloc.isDarkMode ? Colors.white : Colors.black,
                      fontSize: _size
                    ),
                  ),
                  Image.asset(
                    icon,
                    height: _size,
                    width: _size,
                    color: appBloc.isDarkMode ? Colors.white : Colors.black,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}