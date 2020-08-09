import 'dart:convert';
import 'package:artemisfood/src/components/borde_separador.dart';
import 'package:artemisfood/src/components/search_field.dart';
import 'package:artemisfood/src/providers/dark_mode.dart';
import 'package:artemisfood/src/static/const.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Category.dart';
import 'custom_app_bar.dart';
import 'food.dart';
import 'listado_favoritos.dart';
import 'package:http/http.dart' as http ;

class BodyHome extends StatelessWidget {

  void requestSearch(String text) async {
    final url = '${server}search/?query=$text'; // TODO: backend de search imaginario, es un ejemplo
    final response = await http.get(url);
    final data = jsonDecode(response.body);
    print(data);
  }

  @override
  Widget build(BuildContext context) {
    final appBloc = Provider.of<AppBloc>(context, listen: false);
    return CustomScrollView(
      slivers: <Widget>[
        CustomAppBar(
          bottomBody: SearchField(
            onChanged: appBloc.onChangedText,
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
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: <Widget>[
                    CategoryTitle(title: "All", active: true),
                    CategoryTitle(title: "Italian"),
                    CategoryTitle(title: "Asian"),
                    CategoryTitle(title: "Chinese"),
                    CategoryTitle(title: "Burgers"),
                  ],
                ),
              ),
              BordeSeparador(),
              // appBloc.searchText.isEmpty ? ListViewFood() : Container(),
              ListViewFood(),
            ],
          ),
        ),
      ],
    );
  }
}
