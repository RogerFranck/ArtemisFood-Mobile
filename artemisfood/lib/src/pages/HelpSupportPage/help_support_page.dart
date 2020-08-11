import 'package:artemisfood/src/components/RoundedButton.dart';
import 'package:artemisfood/src/components/TextButton.dart';
import 'package:artemisfood/src/components/custom_bottom_body.dart';
import 'package:artemisfood/src/pages/FoodPage/components/Comentarios.dart';
import 'package:artemisfood/src/pages/HomePage/components/custom_app_bar.dart';
import 'package:artemisfood/src/providers/app_bloc.dart';
import 'package:artemisfood/src/static/const.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HelpSupportPage extends StatelessWidget {
  const HelpSupportPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appBloc = Provider.of<AppBloc>(context, listen: false);
    final _separador = SizedBox(height: 20.0,);
    final Orientation orientation = MediaQuery.of(context).orientation; //landscape, portrait
    
    return Scaffold(
      backgroundColor: appBloc.isDarkMode? backgroundHomeDark : backgroundHome,
      body: CustomScrollView(
        slivers: [
          CustomAppBar(
            bottomBody: CustomBottomBody(title: 'Help and Support'),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      FractionallySizedBox(
                        widthFactor: orientation == Orientation.portrait ? 1 : .5,
                        child: Image.asset(
                          '$imgPath/dino_phone_call.png'
                        ),
                      ),
                      _separador,
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Estamos comprometidos a escuchar tus opiniones sobre la aplicación de ArtemisFood Mobile',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: appBloc.isDarkMode ? Colors.white : Colors.black,
                            fontSize: 16.0
                          ),
                        ),
                      ),
                      _separador,
                      // RichText(
                      //   textAlign: TextAlign.center,
                      //   text: TextSpan(
                      //     children: <TextSpan>[
                      //       TextSpan(
                      //         text: 'Escribe tú ',
                      //         style: TextStyle(
                      //           color: appBloc.isDarkMode ? Colors.white : Colors.black,
                      //           fontSize: _titleSize,
                      //         )
                      //       ),
                      //       TextSpan(
                      //         text: 'Comentario',
                      //         style: TextStyle(
                      //           color: primaryColor,
                      //           fontSize: _titleSize,
                      //         )
                      //       ),
                      //     ]
                      //   ),
                      // )
                      Comentarios(),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(horizontal : 20.0, vertical: 5.0),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     mainAxisSize: MainAxisSize.max,
                      //     children: [
                      //       HelpButton(
                      //         hintText: 'Regresar',
                      //         color: primaryColor,
                      //         onPressed: () {
                      //           Navigator.pop(context);
                      //         },
                      //       ),
                      //       HelpButton(
                      //         hintText: 'Enviar',
                      //         color: primaryColor,
                      //         onPressed: () {},
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      FractionallySizedBox(
                        widthFactor: .6,
                        child: RoundedButton(
                          hintText: 'Enviar comentario',
                        ),
                      ),
                      TextButton(
                        hintText: 'Regresar',
                        onPress: () {
                          Navigator.pop(context);
                        },
                        color: appBloc.isDarkMode ? Colors.white : primaryColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

