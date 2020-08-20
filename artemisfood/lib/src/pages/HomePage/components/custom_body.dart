import 'dart:math';
import 'package:flutter/rendering.dart';
import 'package:artemisfood/src/components/borde_separador.dart';
import 'package:artemisfood/src/components/search_field.dart';
import 'custom_app_bar.dart';
import 'package:artemisfood/src/providers/app_bloc.dart';
import 'package:artemisfood/src/static/const.dart';
import 'package:artemisfood/src/static/lista_temporal_categorias.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'Category.dart';
import 'food.dart';

class CustomBody extends StatefulWidget {
  CustomBody({Key key}) : super(key: key);

  @override
  _CustomBodyState createState() => _CustomBodyState();
}

double pageOffset = 0;
double _viewPortFraction = 0.77;
PageController _pageController = PageController(viewportFraction: _viewPortFraction, initialPage: 0);

class _CustomBodyState extends State<CustomBody> {

  void _listenScroll() {
    setState(() {
      pageOffset = _pageController.page;
    });
  }

  @override
  void initState() { 
    
    _pageController.addListener(_listenScroll);
    if (Provider.of<AppBloc>(context, listen: false).category.length == 1) {
      Provider.of<AppBloc>(context, listen: false).getAllCategories();
    }
    if (Provider.of<AppBloc>(context, listen: false).productosMostrados == null) {
      Provider.of<AppBloc>(context, listen: false).getProducts();
    }
    super.initState();
  }

  @override
  void dispose() {
    // ignore: todo
    // TODO: implement dispose
    _pageController.removeListener(_listenScroll);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appBloc = Provider.of<AppBloc>(context, listen: false);

    return CustomScrollView(
       slivers: [
         CustomAppBar(bottomBody: SearchField(
           onChanged: (val) {
              val = val.toLowerCase();
              appBloc.onChanged(val);
            },
         )),
         SliverFillRemaining(
           hasScrollBody: false,
           child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 20.0, bottom: 10.0),
                    child: Shimmer.fromColors(
                      baseColor: primaryColor,
                      highlightColor: Color(0xffe100ff),
                      child: Text(
                        'Tus Favoritos',
                        style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700,),
                      ),
                    )
                  ),
                ),
                Container(height: 300.0, child: CustomFavoriteList(),),
                SizedBox(height: 10.0,),
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
      child: Center(
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
               style: TextStyle(
                 fontWeight: FontWeight.w500
               ),
             )
          ],
        ),
      ),
    );
  }
}

class CustomFavoriteList extends StatelessWidget {
  const CustomFavoriteList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      physics: AlwaysScrollableScrollPhysics(),
      controller: _pageController,
      itemCount: listaCategorias.length,
      itemBuilder: (_, index) {
        double scale = max(_viewPortFraction, (1 - (pageOffset - index).abs()) + _viewPortFraction);
        double angle = (pageOffset - index).abs().clamp(0.0, 1.0);
        final factor = _pageController.position.userScrollDirection == ScrollDirection.forward ? 1.0 : -1.0;
        angle > 0.5 ? angle = 1 - angle : null;

        return Container(
          padding: EdgeInsets.only(
            right: 10.0,
            left: 10.0,
            top: 60 - scale * 25,
            bottom: 60 - scale * 25,
          ),
          child: Transform(
            transform: Matrix4.identity()
                              ..setEntry(3, 2, 0.001)
                              ..rotateY(factor * angle),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Column(
                  children: [
                    FractionallySizedBox(
                      widthFactor: 1,
                      child: Opacity(
                        opacity: 1 - angle,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Material(
                            elevation: 5,
                            child: Image.network(
                              listaCategorias[index].imagen,
                              height: constraints.maxHeight * 0.7,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 8,
                            child: Text(
                              listaCategorias[index].nombre,
                              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              '\$${listaCategorias[index].precio}',
                              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700, color: primaryColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 8,
                            child: Text(
                              'Ullamco aliquip eu sit laboris sunt non aliquip id. Ullamco aliquip eu sit laboris sunt non aliquip id',
                              style: TextStyle(fontSize: 11.0, color: Colors.grey, fontWeight: FontWeight.w500),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Flexible(
                            flex: 3,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: Image.asset(
                                '$iconPath/favorite_angel.png',
                                width: 24.0,
                                color: Colors.red,
                              ),
                            )
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      }
    );
  }
}