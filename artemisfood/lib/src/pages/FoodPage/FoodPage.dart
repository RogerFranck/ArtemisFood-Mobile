import 'package:artemisfood/src/components/TextButton.dart';
import 'package:artemisfood/src/pages/FoodPage/components/ButtonRoudend.dart';
import 'package:artemisfood/src/static/const.dart';
import 'package:flutter/material.dart';
import 'components/Comentarios.dart';
import 'components/Description.dart';
import 'components/ImageFood.dart';
import 'components/PriceFood.dart';

class FoodPage extends StatelessWidget {
  const FoodPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundHome,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ImageFood(),
              Description(),
              PriceFood(),
              Comentarios(),
              ButtonRoundend(
                hintText: 'Añadir al carrito',
                onPress: () {},
              ),
              TextButton(
                hintText: 'Seguir buscando',
                onPress: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}



