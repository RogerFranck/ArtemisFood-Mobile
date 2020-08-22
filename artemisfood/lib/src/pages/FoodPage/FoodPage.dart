import 'package:artemisfood/src/animations/shake_transition.dart';
import 'package:artemisfood/src/components/TextButton.dart';
import 'package:artemisfood/src/model/producto.dart';
import 'package:artemisfood/src/pages/FoodPage/components/ButtonRoudend.dart';
import 'package:artemisfood/src/providers/app_bloc.dart';
import 'package:artemisfood/src/static/const.dart';
import 'package:artemisfood/src/widgets/custom_dialog_food.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'components/Comentarios.dart';
import 'components/Description.dart';
import 'components/ImageFood.dart';
import 'components/PriceFood.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({Key key}) : super(key: key);

  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  @override
  Widget build(BuildContext context) {
    final appBloc = Provider.of<AppBloc>(context, listen: false);
    final _color =  appBloc.isDarkMode ? backgroundHomeDark : backgroundHome;
    final Producto producto = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      backgroundColor: _color,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ImageFood(
                imagen: producto.foto,
                hero:'food_item${producto.id}',
              ),
              ShakeTransition(
                child: Description(
                  nombre: producto.nombre,
                  descripcion: producto.descripcion,
                ),
              ),
              ShakeTransition(
                  child: PriceFood(
                  precio: producto.precio,
                ),
              ),
              ShakeTransition(
                child: Comentarios(),
              ),
              ShakeTransition(
                axis: Axis.vertical,
                child: ButtonRoundend(
                  hintText: 'Añadir al carrito',
                  onPress: () {
                    return showDialog(
                      context: context,
                      barrierColor: Colors.black.withOpacity(0.5),
                      builder: (_) {
                        return CustomDialogFood(producto: producto);
                      }
                    );
                    // print(appBloc.carrito);
                  },
                ),
              ),
              ShakeTransition(
                axis: Axis.vertical,
                child: TextButton(
                  hintText: 'Seguir buscando',
                  onPress: () {
                    Navigator.pop(context);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}






