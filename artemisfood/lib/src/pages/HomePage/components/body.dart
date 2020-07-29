import 'package:artemisfood/src/components/borde_separador.dart';
import 'package:artemisfood/src/components/search_field.dart';
import 'package:flutter/material.dart';
import 'Category.dart';
import 'custom_app_bar.dart';
import 'food.dart';
//import 'listado_categorias.dart';
import 'listado_favoritos.dart';

class BodyHome extends StatelessWidget {
  const BodyHome({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        CustomAppBar(
          bottomBody: SearchField(),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 10.0),
                child: Text(
                  'Favoritos',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0),
                ),
              ),
              //ListViewFavorites(),
              ListViewFavorites(),
              SizedBox(
                height: 10.0,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: <Widget>[
                    CategoryTitle(title: "All", active: true),
                    CategoryTitle(title: "Italian"),
                    CategoryTitle(title: "Asian"),
                    CategoryTitle(title: "Chinese"),
                    CategoryTitle(title: "Burgers"),
                  ],
                ),
              ),
              BordeSeparador(),
              ListViewFood(),
            ],
          ),
        ),
      ],
    );
  }
}
