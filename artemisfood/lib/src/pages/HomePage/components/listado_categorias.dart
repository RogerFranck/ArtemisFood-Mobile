import 'package:artemisfood/src/components/TextButton.dart';
import 'package:artemisfood/src/static/lista_temporal_categorias.dart';
import 'package:flutter/material.dart';

class ListViewCategorias extends StatelessWidget {
  final String texto;
  const ListViewCategorias({
    Key key, 
    this.texto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: 10.0,
        maxHeight: 30.0
      ),
      child: Container(
        width: double.infinity,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: listaCategorias.length,
          itemBuilder: (context, index) {
            return TextButton(
              hintText: listaCategorias[index].categoria,
              color: Colors.black,
              fontWeight: FontWeight.w300,
              fontSize: 20.0,
              onPress: () {},
            );
          },
        ),
      ),
    );
  }
}