import 'package:artemisfood/src/model/producto.dart';
import 'package:artemisfood/src/providers/app_bloc.dart';
import 'package:artemisfood/src/static/const.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class CustomFoodList extends StatefulWidget {
  const CustomFoodList({
    Key key,
  }) : super(key: key);

  @override
  _CustomFoodListState createState() => _CustomFoodListState();
}

ScrollController _listController = ScrollController();
double topContainer = 0;

class _CustomFoodListState extends State<CustomFoodList> {
  void _listenScroll() {
    double value = _listController.offset / (175.0 * 0.65);

    setState(() {
      topContainer = value;
    });
  }

  @override
  void initState() {
    _listController.addListener(_listenScroll);
    super.initState();
  }

  @override
  void dispose() {
    _listController.removeListener(_listenScroll);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppBloc>(
      builder: (context, bloc, widget) {
        return Expanded(
          child: Container(
            // height: bloc.productosMostrados.length > 3
            //     ? 400
            //     : bloc.productosMostrados.length >= 2
            //         ? 300
            //         : bloc.productosMostrados.length == 1 ? 200 : 0,
            child: ListView.builder(
              controller: _listController,
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              itemCount: bloc.productosMostrados.length,
              itemBuilder: (_, index) {
                double scale = 1.0;
                Producto producto = bloc.productosMostrados[index];

                if (topContainer > 0.5) {
                  scale = index + 0.5 - topContainer;

                  if (scale < 0) {
                    scale = 0;
                  } else if (scale > 1) {
                    scale = 1;
                  }
                }

                return Opacity(
                  opacity: scale,
                  child: Transform(
                    transform: Matrix4.identity()..scale(scale, scale),
                    alignment: Alignment.bottomCenter,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, 'Food',
                            arguments: producto);
                      },
                      child: Align(
                        heightFactor: 0.65,
                        alignment: Alignment.topCenter,
                        child: CustomFoodItem(producto: producto),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}

class CustomFoodItem extends StatelessWidget {
  const CustomFoodItem({
    Key key,
    @required this.producto,
  }) : super(key: key);

  final Producto producto;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Container(
        height: 175.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25.0),
          boxShadow: <BoxShadow>[
            BoxShadow(
                blurRadius: 10.0,
                spreadRadius: 2.0,
                color: Colors.black26,
                offset: Offset(-2.0, -1.0)),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Shimmer.fromColors(
                      child: Text(
                        producto.nombre,
                        style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      baseColor: Colors.redAccent,
                      highlightColor: primaryColor,
                    ),
                    
                    const SizedBox(height: 5.0),
                    Text(
                      producto.categoria,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Colors.grey),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      '\$${producto.precio.toDouble()}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: primaryColor
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 4,
                child: Align(
                  alignment: Alignment.topRight,
                  child: FractionallySizedBox(
                    widthFactor: .65,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Hero(
                        tag: 'food_item${producto.id}',
                        child: Image(
                          image: NetworkImage(producto.foto),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
