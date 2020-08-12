import 'dart:convert';

import 'package:artemisfood/src/components/borde_separador.dart';
import 'package:artemisfood/src/components/search_field.dart';
import 'package:artemisfood/src/model/producto.dart';
import 'package:artemisfood/src/providers/app_bloc.dart';
import 'package:artemisfood/src/static/const.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Category.dart';
import 'custom_app_bar.dart';
import 'food.dart';
import 'listado_favoritos.dart';
import 'package:http/http.dart' as http ;

class BodyHome extends StatefulWidget {

  @override
  _BodyHomeState createState() => _BodyHomeState();
}

class _BodyHomeState extends State<BodyHome> {
  List<dynamic> categoryData;
  final List<String> category = ['All'];
  List<Producto> _productos = List<Producto>();
  List<Producto> _productosMostrados = List<Producto>();

  Future<List<Producto>> getProducts() async {
    var url = '$server/producto';
    var response = await http.get(url);

    var productos = List<Producto>();

    if (response.statusCode == 200) {
      var productsJson = jsonDecode(response.body);
      for (var i in productsJson["Producto"]) {
        productos.add(Producto.fromJson(i));
      }

    }

    return productos;
  }

  void getCategory() async {
    http.Response response = await http.get('$server/producto');
    var data = jsonDecode(response.body);
    categoryData = data["Producto"];
    for (var i = 0; i < categoryData.length; i++) {
      if (!category.contains(categoryData[i]["categoria"])) {
        setState(() {
          category.add(categoryData[i]["categoria"]);
        });
      } else {
        continue;
      }
    }
    print('Recibí categoría');
  }

  @override
  void initState() { 
    super.initState();
    getCategory();
    getProducts().then((value) {
      setState(() {
        _productos.addAll(value);
        _productosMostrados = _productos;
        print('recibí los productos');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final appBloc = Provider.of<AppBloc>(context, listen: false);
    return CustomScrollView(
      slivers: <Widget>[
        CustomAppBar(
          bottomBody: SearchField(
            onChanged: (val) {
              val = val.toLowerCase();
              setState(() {
                _productosMostrados = _productos.where((producto) {
                  var productoNombre = producto.nombre.toLowerCase();
                  return productoNombre.contains(val);
                }).toList();
                print(_productosMostrados);
              });
            },
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 10.0),
                child: Text(
                  'Favoritos',
                  style: TextStyle(
                    fontWeight: FontWeight.w500, 
                    fontSize: 20.0,
                    color: appBloc.isDarkMode ? Colors.white : Colors.black,
                  ),
                  
                ),
              ),
              //ListViewFavorites(),
              ListViewFavorites(),
              SizedBox(
                height: 10.0,
              ),
              // SingleChildScrollView(
              //   scrollDirection: Axis.horizontal,
              //   child: Row(
              //     children: <Widget>[
              //       CategoryTitle(title: "All", active: true),
              //       CategoryTitle(title: "Italian"),
              //       CategoryTitle(title: "Asian"),
              //       CategoryTitle(title: "Chinese"),
              //       CategoryTitle(title: "Burgers"),
              //     ],
              //   ),
              // ),
              CategoryTitle(
                category: category,
              ),
              BordeSeparador(),
              // appBloc.searchText.isEmpty ? ListViewFood() 
              //                            : appBloc.listadoBusqueda == null ? loadingCircular 
              //                            : appBloc.listadoBusqueda.length == 0 ? SinResultados() 
              //                            : SearchedFood(),
              _productosMostrados.length == 0 ? SinResultados() : ListViewFood(
                                                                    productos: _productosMostrados,
                                                                    getProducts: getProducts(),
                                                                  ),
            ],
          ),
        ),
      ],
    );
  }
}

class SinResultados extends StatelessWidget {
  const SinResultados({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appBloc = Provider.of<AppBloc>(context, listen: false);

    return Padding(
      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: Column(
        children: <Widget>[
          FractionallySizedBox(
            widthFactor: .4,
            child: Image.asset('$imgPath/dino_triste.png')
           ),
           SizedBox(height: 10.0,),
           Text(
             'Si tan sólo tuviéramos ese \nproducto pana...',
             style: TextStyle(
               color: appBloc.isDarkMode ? Colors.white : Colors.black,
             ),
             textAlign: TextAlign.center,
           )
        ],
      ),
    );
  }
}
