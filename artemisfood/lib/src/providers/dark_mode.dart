import 'package:flutter/material.dart';
import 'package:artemisfood/src/static/debouncer.dart';

class AppBloc extends ChangeNotifier {
  final debouncer = Debouncer();
  bool isDarkMode = false;
  String searchText = '';

  void onThemeUpdated(bool isDark) {
    isDarkMode = isDark;
    notifyListeners();
  }

  void onChangedText(String text) {
    searchText = text;
    debouncer.run(() {
      print('text : $searchText');
    });
    notifyListeners();
  }
}