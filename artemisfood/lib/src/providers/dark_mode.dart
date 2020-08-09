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

  void onThemeUpdated(bool isDark) {
    isDarkMode = isDark;
    notifyListeners();
  }

  void onChangedText(String text) {
    searchText = text;
    debouncer.run(() {
      requestSearch(searchText);
    });
    notifyListeners();
  }

  Future requestSearch(String text) async {
    final url = '$server/producto/find/$text';
    final response = await http.get(url);
    final data = jsonDecode(response.body);
    listadoBusqueda = data;
    notifyListeners();
    return data;
  }
}