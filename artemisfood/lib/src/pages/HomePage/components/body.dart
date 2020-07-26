import 'package:artemisfood/src/components/borde_separador.dart';
import 'package:artemisfood/src/components/search_field.dart';
import 'package:artemisfood/src/components/title_app_bar.dart';
import 'package:flutter/material.dart';
import 'food.dart';
import 'listado_categorias.dart';
import 'listado_favoritos.dart';

class BodyHome extends StatelessWidget {
  const BodyHome({
    Key key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          flexibleSpace: FlexibleSpaceBar(
            title: Text('data'),
            background: Container(
              
            ),
          ),
          pinned: true,
          title: TitleAppBar(),
          bottom: PreferredSize(
            preferredSize: Size(size.width * 0.9, 60),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: SearchField(),
            ),
          ),
          backgroundColor: Colors.white,
          expandedHeight: 130.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(10.0),)
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
                child: Text(
                  'Favoritos',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20.0
                  ),
                ),
              ),
              ListViewFavorites(),
              SizedBox(
                height: 10.0,
              ),
              ListViewCategorias(),
              BordeSeparador(),
              ListViewFood(),
            ],
          ),
        ),
      ],
    );
  }
}