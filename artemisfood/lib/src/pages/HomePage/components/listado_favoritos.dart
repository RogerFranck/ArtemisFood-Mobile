import 'package:artemisfood/src/static/const.dart';
import 'package:artemisfood/src/static/lista_temporal_categorias.dart';
import 'package:flutter/material.dart';

class ListViewFavorites extends StatelessWidget {
  const ListViewFavorites({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: 200.0,
        maxHeight: 225.0
      ),
      child: Container(
        width: double.infinity,
        //height: 200.0,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: listaCategorias.length,
          itemBuilder: (context, index) {
            return FavoriteItem(
              imagen: listaCategorias[index].imagen,
              nombre: listaCategorias[index].nombre,
              precio: listaCategorias[index].precio,
            );
          },
        ),
      ),
    );
  }
}

class FavoriteItem extends StatelessWidget {
  final String nombre;
  final double precio;
  final String imagen;
  const FavoriteItem({
    Key key, 
    this.nombre, 
    this.precio, 
    this.imagen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  spreadRadius: 1.0,
                  offset: Offset(4.0, 7.0)
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Container(
                height: 175.0,
                child: Image(
                  image: NetworkImage(imagen),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            width: 250.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Text(
                    nombre,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    '$precio MXN',
                    style: TextStyle(fontWeight: FontWeight.bold, color: primaryColor, fontSize: 15.0),
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}