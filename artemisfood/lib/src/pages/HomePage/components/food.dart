import 'package:artemisfood/src/static/const.dart';
import 'package:artemisfood/src/static/lista_temporal_categorias.dart';
import 'package:flutter/material.dart';

class ListViewFood extends StatelessWidget {
  const ListViewFood({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 275.0 * listaCategorias.length,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: listaCategorias.length,
        itemBuilder:  (_, index) {
          return FoodItem(
            imagen: listaCategorias[index].imagen,
            nombre: listaCategorias[index].nombre,
            precio: listaCategorias[index].precio,
          );
        }
      ),
    );
  }
}

class FoodItem extends StatelessWidget {
  final String imagen;
  final String nombre;
  final double precio;
  const FoodItem({
    Key key, 
    this.imagen, 
    this.nombre, 
    this.precio,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20),
      child: Container(
        height: 250.0,
        child: FractionallySizedBox(
          widthFactor: 0.9,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  spreadRadius: 1.0,
                  offset: Offset(2.0, 10.0)
                ),
              ],
            ),
            child: Column(
              children: <Widget>[
                FractionallySizedBox(
                  widthFactor: 1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20.0),),
                    child: Container(
                      height: 175.0,
                      child: Image( 
                        image: NetworkImage(imagen),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(
                        flex: 7,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              nombre,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(
                              height: 3.0,
                            ),
                            Text(
                              'Con pepinillos, salsa de tomate, vegetales, etc.',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 10.0
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        flex: 3,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            '\$$precio',
                            style: TextStyle(
                              color: primaryColor,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}