import 'package:artemisfood/src/model/producto.dart';
import 'package:artemisfood/src/providers/app_bloc.dart';
import 'package:artemisfood/src/static/const.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListViewFood extends StatefulWidget {
  
  ListViewFood({
    Key key,
  }) : super(key: key);


  @override
  _ListViewFoodState createState() => _ListViewFoodState();
}

class _ListViewFoodState extends State<ListViewFood> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appBloc = Provider.of<AppBloc>(context, listen: false);
    return Container(
      height: 273.0 * appBloc.productosMostrados.length,
      child: ListView.builder(
        padding: EdgeInsets.only(top: 20, bottom: 0),
        physics: NeverScrollableScrollPhysics(),
        itemCount: appBloc.productosMostrados == null ? 0: appBloc.productosMostrados.length,
        itemBuilder:  (_, index) {
          return _foodItem(appBloc.productosMostrados[index]);
        }
      ),
    );
  }

  Widget _foodItem(Producto producto) {
    final appBloc = Provider.of<AppBloc>(context, listen: false);

    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, 'Food', arguments: producto);
      },
      child: Padding(
        padding: EdgeInsets.only(bottom: 20),
        child: Container(
          height: 250.0,
          child: FractionallySizedBox(
            widthFactor: 0.9,
            child: Container(
              decoration: BoxDecoration(
                color: appBloc.isDarkMode ? Color(0xFF949494) : Colors.white,
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10.0,
                    spreadRadius: 1.0,
                    offset: Offset(2.0, 5.0)
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
                        child: Hero(
                          tag: 'food_item${producto.id}',
                          child: FadeInImage( 
                            image: NetworkImage(producto.foto),
                            placeholder: NetworkImage('https://media1.tenor.com/images/c7cce308690c435002dfedee6889d135/tenor.gif?itemid=15742167'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 5.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Flexible(
                          flex: 7,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                producto.nombre,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                  color: appBloc.isDarkMode ? Colors.white : Colors.black,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(
                                height: 3.0,
                              ),
                              Text(
                                producto.descripcion,
                                style: TextStyle(
                                  color: appBloc.isDarkMode ? Colors.white.withOpacity(0.8) : Colors.grey,
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
                              '\$${producto.precio.toDouble()}',
                              style: TextStyle(
                                color: appBloc.isDarkMode ? Colors.white : primaryColor,
                                fontSize: 18.0,
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
      ),
    );
  }

}

// class SearchedFood extends StatefulWidget {
//   SearchedFood({Key key}) : super(key: key);

//   @override
//   _SearchedFoodState createState() => _SearchedFoodState();
// }

// class _SearchedFoodState extends State<SearchedFood> {
//   @override
//   Widget build(BuildContext context) {
//     final appBloc = Provider.of<AppBloc>(context, listen: false);
//     return FutureBuilder(
//       future: appBloc.requestSearch(appBloc.searchText),
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           return Container(
//             height: 275.0 * appBloc.listadoBusqueda.length,
//             child: ListView.builder(
//               physics: NeverScrollableScrollPhysics(),
//               itemCount: appBloc.listadoBusqueda == null ? 0 : appBloc.listadoBusqueda.length,
//               itemBuilder:  (_, index) {
//                 return FoodItem(
//                   imagen: appBloc.listadoBusqueda[index]["foto"],
//                   nombre: appBloc.listadoBusqueda[index]["nombre"],
//                   precio: appBloc.listadoBusqueda[index]["precio"],
//                 );
//               }
//             ),
//           );
//         } else {
//           return loadingCircular;
//         }
//       },
//     );
//   }
// }
