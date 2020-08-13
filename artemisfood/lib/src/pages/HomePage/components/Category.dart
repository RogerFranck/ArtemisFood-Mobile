import 'package:artemisfood/src/providers/app_bloc.dart';
import 'package:artemisfood/src/static/const.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:artemisfood/src/model/producto.dart';

class CategoryTitle extends StatefulWidget {
  List<Producto> productos;
  List<Producto> productosMostrados;
  CategoryTitle({Key key, this.productosMostrados, this.productos}) : super(key: key);

  @override
  _CategoryTitleState createState() => _CategoryTitleState();
}

class _CategoryTitleState extends State<CategoryTitle> {
  @override
  Widget build(BuildContext context) {
    final appBloc = Provider.of<AppBloc>(context, listen: false);
    return Container(
      height: 20,
      width: appBloc.category.length * 100.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: appBloc.category.length,
        itemBuilder: (_, index) {
          return InkWell(
            onTap: () {

              if (appBloc.selected == appBloc.category[index]) {
                print('Ya lo seleccionaste');
              } else {
                appBloc.onCategoryUpdated(index);
                appBloc.getProductsPerCategory();
              }
              
            },
            splashColor: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 25),
              child: Text(
                appBloc.category[index],
                style: TextStyle(
                   color:  appBloc.selected == appBloc.category[index] ? primaryColor : appBloc.isDarkMode ? Colors.white : Colors.black.withOpacity(0.6),
                   fontWeight: appBloc.selected == appBloc.category[index] ? FontWeight.bold : null,
                )
              ),
            ),
          );
        }
      ),
    );
  }
}