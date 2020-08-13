import 'dart:convert';
import 'package:artemisfood/src/model/producto.dart';
import 'package:artemisfood/src/static/const.dart';
import 'package:http/http.dart' as http ;
import 'package:flutter/material.dart';
import 'package:artemisfood/src/static/debouncer.dart';

class AppBloc extends ChangeNotifier {
  final debouncer = Debouncer();
  bool isDarkMode = false;
  String searchText = '';
  List<dynamic> listadoBusqueda;
  List<Producto> productosActual;
  List<Producto> productosMostrados;
  String selected = 'All';
  List<String> category = ['All'];
  List<dynamic> categoryData;

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
    productosActual = productos;
    productosMostrados = productosActual;
    notifyListeners();
    print('...');
    return productos;
  }

  void onChanged(String val) {
    productosMostrados = productosActual.where((producto) {
      var productoNombre = producto.nombre.toLowerCase();
      return productoNombre.contains(val);
    }).toList();
    notifyListeners();
  }

  void getAllCategories() async {
    http.Response response = await http.get('$server/categoria');
    var data = jsonDecode(response.body);
    categoryData = data;
    for (var i = 0; i < categoryData.length; i++) {
      category.add(categoryData[i]["categoria"]);
      notifyListeners();
    }
    print('Recibí categoría');
  }

  Future<List<Producto>> getProductsPerCategory() async {
    var productos = List<Producto>();

    if (selected == 'All') {
      getProducts().then((value) {
        productos.addAll(value);
        notifyListeners();
        print('recibí los productos');
        print(productos);
      });

      return productos;
    }

    var url = '$server/producto/categoria/$selected';
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var productsJson = jsonDecode(response.body);
      for (var i in productsJson) {
        productos.add(Producto.fromJson(i));
        
      }

    }
    productosActual = productos;
    productosMostrados = productosActual;
    notifyListeners();
    return productos;

  }

  void onCategoryUpdated(int index) {
    selected = category[index];
    notifyListeners();
  }

  void onThemeUpdated(bool isDark) {
    isDarkMode = isDark;
    notifyListeners();
  }

  void onChangedText(String text) {
    searchText = text;
    requestSearch(text);
    notifyListeners();
  }

  Future requestSearch(String text) async {
    String url = "$server/producto/find/$text";
    http.Response response = await http.get(url);
    dynamic data = jsonDecode(response.body);
    listadoBusqueda = data;
    notifyListeners();
    // print('recibí info');
    return data;
  }

}

