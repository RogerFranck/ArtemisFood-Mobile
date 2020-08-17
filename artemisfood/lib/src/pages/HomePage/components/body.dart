import 'package:artemisfood/src/components/borde_separador.dart';
import 'package:artemisfood/src/components/search_field.dart';
import 'package:artemisfood/src/providers/app_bloc.dart';
import 'package:artemisfood/src/static/const.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Category.dart';
import 'custom_app_bar.dart';
import 'food.dart';
import 'listado_favoritos.dart';

class BodyHome extends StatefulWidget {

  @override
  _BodyHomeState createState() => _BodyHomeState();
}

class _BodyHomeState extends State<BodyHome> {
  List<dynamic> categoryData;

  @override
  void initState() { 
    super.initState();
    if (Provider.of<AppBloc>(context, listen: false).category.length == 1) {
      Provider.of<AppBloc>(context, listen: false).getAllCategories();
    }
    if (Provider.of<AppBloc>(context, listen: false).productosMostrados == null) {
      Provider.of<AppBloc>(context, listen: false).getProducts();
    }
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
              appBloc.onChanged(val);
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
                  ),
                  
                ),
              ),
              //ListViewFavorites(),
              ListViewFavorites(),
              SizedBox(
                height: 10.0,
              ),
              CategoryTitle(),
              BordeSeparador(),
              appBloc.productosMostrados == null ? loadingCircular : appBloc.productosMostrados.length == 0 ? SinResultados() : ListViewFood(),
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
             textAlign: TextAlign.center,
           )
        ],
      ),
    );
  }
}
