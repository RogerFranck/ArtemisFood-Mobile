import 'package:artemisfood/src/animations/shake_transition.dart';
import 'package:artemisfood/src/components/TextButton.dart';
import 'package:artemisfood/src/model/producto.dart';
import 'package:artemisfood/src/pages/FoodPage/components/ButtonRoudend.dart';
import 'package:artemisfood/src/providers/app_bloc.dart';
import 'package:artemisfood/src/static/const.dart';
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
                        int _elementoSeleccionado = 1;
                        return Dialog(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                          child: Container(
                            height: 300.0,
                            child: SingleChildScrollView(
                              child: Padding(
                                padding: EdgeInsets.all(20.0),
                                child: Column(
                                  children: [
                                    FractionallySizedBox(
                                      widthFactor: .5,
                                      child: Image(
                                        image: AssetImage('$imgPath/space_dinosaur.png')
                                      ),
                                    ),
                                    Text(
                                      producto.nombre,
                                      style: TextStyle(color: primaryColor, fontSize: 20.0, fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 10.0),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Cantidad deseada', style: TextStyle(fontSize: 16.0),),
                                        DropdownButton(
                                          value: _elementoSeleccionado,
                                          onChanged: (val) {
                                            setState(() {
                                              _elementoSeleccionado = val;
                                            });
                                            print(_elementoSeleccionado);
                                          },
                                          items: [
                                            _customDropdown('1', 1),
                                            _customDropdown('2', 2),
                                            _customDropdown('3', 3),
                                            _customDropdown('4', 4),
                                            _customDropdown('5', 5),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10.0,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Costo', style: TextStyle(fontSize: 16.0),),
                                        Text('\$${(producto.precio * _elementoSeleccionado).toDouble()}', style: TextStyle(fontSize: 16.0, color: primaryColor, fontWeight: FontWeight.bold),)
                                      ],
                                    ),
                                     SizedBox(height: 10.0,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        FlatButton(
                                          onPressed: () {
                                            appBloc.pushToCart(producto);
                                            appBloc.getTotal();
                                            Navigator.pop(context);
                                          }, 
                                          child: Text('Aceptar', style: TextStyle(color: Colors.green[400]),),
                                        ),
                                        FlatButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          }, 
                                          child: Text('Cancelar', style: TextStyle(color: Colors.red[400]),),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
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

  DropdownMenuItem _customDropdown(String text, int value) {
    
    return DropdownMenuItem(
      child: Text(text),
      value: value,
      onTap: () {},
    );
  }
}





