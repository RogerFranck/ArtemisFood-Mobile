import 'package:artemisfood/src/components/RoundedButton.dart';
import 'package:artemisfood/src/components/custom_bottom_body.dart';
import 'package:artemisfood/src/pages/HomePage/components/custom_app_bar.dart';
import 'package:artemisfood/src/providers/app_bloc.dart';
import 'package:artemisfood/src/static/const.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appBloc = Provider.of<AppBloc>(context, listen: false);
    
    return Scaffold(
      backgroundColor: appBloc.isDarkMode ? backgroundHomeDark : backgroundHome,
      body: CustomScrollView(
        slivers: [
          CustomAppBar(
            bottomBody: CustomBottomBody(title: 'About'),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Column(
                    children: [
                      FractionallySizedBox(
                        widthFactor: .5,
                        child: Image.asset(
                          '$imgPath/space_dinosaur.png'
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
"""Eiusmod consequat dolor laboris consectetur commodo ipsum aliquip minim aute est Lorem velit. Velit eu et dolor ullamco in dolor duis enim occaecat ut duis anim incididunt. Minim eu Lorem aute non culpa qui do eu aliqua laboris. Esse id ullamco enim enim culpa.

Eiusmod consequat dolor laboris consectetur commodo ipsum aliquip minim aute est Lorem velit. Velit eu et dolor ullamco in dolor duis enim occaecat ut duis anim incididunt. Minim eu Lorem aute non culpa qui do eu aliqua laboris. Esse id ullamco enim enim culpa.""",
                          style: TextStyle(
                            color: appBloc.isDarkMode ? Colors.white :  Colors.black,
                            fontSize: 16.0,
                            letterSpacing: 1.5
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      RoundedButton(
                        hintText: 'Regresar',
                        onPress: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                )
              ]
            )
          )
        ],
      ),
    );
  }
}