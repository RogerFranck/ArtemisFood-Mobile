import 'package:artemisfood/src/providers/dark_mode.dart';
import 'package:artemisfood/src/static/const.dart';
import 'package:artemisfood/src/static/lista_temporal_categorias.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListViewFavorites extends StatelessWidget {
  const ListViewFavorites({
    Key key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: 220.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: listaCategorias.length,
        itemBuilder: (_, index) => FavoriteItem(
          imagen: listaCategorias[index].imagen,
          precio: listaCategorias[index].precio,
          nombre: listaCategorias[index].nombre,
        )
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
    final Size size = MediaQuery.of(context).size;
    final appBloc = Provider.of<AppBloc>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        width: size.width * 0.65,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              // boxShadow: <BoxShadow>[
              //   BoxShadow(
              //     color: Colors.black26,
              //     blurRadius: 10.0,
              //     spreadRadius: 1.0,
              //     offset: Offset(4.0, 7.0)
              //   ),
              // ],
            ),
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    FractionallySizedBox(
                      widthFactor: 1,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Container(
                          height: 150.0,
                          child: FadeInImage( 
                            image: NetworkImage(imagen),
                            placeholder: NetworkImage('https://media1.tenor.com/images/c7cce308690c435002dfedee6889d135/tenor.gif?itemid=15742167'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 5,
                      right: 10.0,
                      child: IconButton(
                        icon: Icon(
                          Icons.favorite,
                          color: Colors.red,
                          size: 30.0,
                        ),
                        onPressed: () {},
                        splashColor: primaryColor,
                      )
                    )
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Flexible(
                          flex: 7,
                          child: Text(
                            nombre,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: appBloc.isDarkMode ? Colors.white : Colors.black,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Flexible(
                          flex: 3,
                          child: Text(
                            '\$$precio',
                            style: TextStyle(
                              color: appBloc.isDarkMode ? Colors.white : primaryColor,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ],
                    ),
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