import 'package:artemisfood/src/model/producto.dart';
import 'package:artemisfood/src/providers/app_bloc.dart';
import 'package:artemisfood/src/static/const.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListViewFood extends StatefulWidget {
  
  ListViewFood({
    Key key,
    @required this.productos, @required this.getProducts,
  }) : super(key: key);

  final List<Producto> productos;
  final Future<List<Producto>> getProducts;

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
    return FutureBuilder(
      future: widget.getProducts,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Container(
            height: 275.0 * widget.productos.length,
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: widget.productos == null ? 0: widget.productos.length,
              itemBuilder:  (_, index) {
                return _foodItem(widget.productos[index].foto, widget.productos[index].nombre, widget.productos[index].descripcion, widget.productos[index].precio);
              }
            ),
          );
        } else {
          return loadingCircular;
        }
      },
    );
  }

  Widget _foodItem(String imagen, String nombre, String descripcion, int precio) {
    final appBloc = Provider.of<AppBloc>(context, listen: false);
    Map<String, dynamic> comida = {
      "imagen" : imagen,
      "nombre" : nombre,
      "precio" : precio
    };

    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, 'Food', arguments: comida);
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
                                nombre,
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
                                descripcion,
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
                              '\$$precio',
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

class FoodItem extends StatelessWidget {
  final String imagen;
  final String nombre;
  final int precio;
  const FoodItem({
    Key key, 
    this.imagen, 
    this.nombre, 
    this.precio,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
  }
}