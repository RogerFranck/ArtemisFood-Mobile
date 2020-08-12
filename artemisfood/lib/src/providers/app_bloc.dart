import 'dart:convert';
import 'package:artemisfood/src/static/const.dart';
import 'package:http/http.dart' as http ;
import 'package:flutter/material.dart';
import 'package:artemisfood/src/static/debouncer.dart';

class AppBloc extends ChangeNotifier {
  final debouncer = Debouncer();
  bool isDarkMode = false;
  String searchText = '';
  List<dynamic> listadoBusqueda;
  String selected = 'All';

  void onCategoryUpdated(List category, int index) {
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

