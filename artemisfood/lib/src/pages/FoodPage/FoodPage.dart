import 'package:artemisfood/src/components/TextButton.dart';
import 'package:artemisfood/src/pages/FoodPage/components/ButtonRoudend.dart';
import 'package:artemisfood/src/providers/app_bloc.dart';
import 'package:artemisfood/src/static/const.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'components/Comentarios.dart';
import 'components/Description.dart';
import 'components/ImageFood.dart';
import 'components/PriceFood.dart';

class FoodPage extends StatelessWidget {
  const FoodPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appBloc = Provider.of<AppBloc>(context, listen: false);
    final _color =  appBloc.isDarkMode ? backgroundHomeDark : backgroundHome;
    final Map<String, dynamic> comida = ModalRoute.of(context).settings.arguments;
    
    return Scaffold(
      backgroundColor: _color,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ImageFood(
                imagen: comida["imagen"],
              ),
              Description(
                nombre: comida["nombre"],
              ),
              PriceFood(
                precio: comida["precio"],
              ),
              Comentarios(),
              ButtonRoundend(
                hintText: 'Añadir al carrito',
                onPress: () {},
              ),
              TextButton(
                hintText: 'Seguir buscando',
                onPress: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}



