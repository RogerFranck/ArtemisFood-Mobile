import 'package:artemisfood/src/static/const.dart';
import 'package:artemisfood/src/static/lista_temporal_categorias.dart';
import 'package:flutter/material.dart';

class ListViewFood extends StatelessWidget {
  const ListViewFood({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: listaCategorias.length * 280.0,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: listaCategorias.length,
        itemBuilder: (context, index) {
          return FoodItem(
            imagen: listaCategorias[index].imagen,
            nombre: listaCategorias[index].nombre,
            precio: listaCategorias[index].precio,
          );
        },
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
      padding: EdgeInsets.only(bottom: 20.0, left: 20.0, right: 20.0,),
      child: Container(
        height: 250.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              spreadRadius: 2.0,
              offset: Offset(2.0, 10.0)
            ),
          ],
        ),
        child: Column(
          children: <Widget>[
            FractionallySizedBox(
              widthFactor: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(10.0),),
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
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            nombre,
                            style: TextStyle(
                              fontSize: 16.0
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            height: 3.0,
                          ),
                          Text(
                            'Pepinillos, cebolla, etc.',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 11.0,
                            ),
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        '$precio MXN',
                        style: TextStyle(fontWeight: FontWeight.bold, color: primaryColor, fontSize: 15.0),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}