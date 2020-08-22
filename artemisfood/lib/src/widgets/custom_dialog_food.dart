import 'package:artemisfood/src/animations/shake_transition.dart';
import 'package:artemisfood/src/model/producto.dart';
import 'package:artemisfood/src/providers/app_bloc.dart';
import 'package:artemisfood/src/static/const.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomDialogFood extends StatefulWidget {
  CustomDialogFood({Key key, @required this.producto}) : super(key: key);

  final Producto producto;

  @override
  _CustomDialogFoodState createState() => _CustomDialogFoodState();
}

int _elementoSeleccionado;
const _separador = SizedBox(height: 20.0);

class _CustomDialogFoodState extends State<CustomDialogFood> {

  @override
  void initState() { 
    _elementoSeleccionado = 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appBloc = Provider.of<AppBloc>(context, listen: false);

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Container(
        constraints: BoxConstraints(
          maxHeight: 450.0,
          minHeight: 300.0
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: ShakeTransition(
              axis: Axis.vertical,
              reverse: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  FractionallySizedBox(
                    widthFactor: .6,
                    child: Image(
                      image: AssetImage('$imgPath/space_dinosaur.png')
                    ),
                  ),
                  ShaderMask(
                    blendMode: BlendMode.srcIn,
                    shaderCallback: (bounds) {
                      return RadialGradient(
                        center: Alignment.bottomRight,
                        radius: 1.0,
                        colors: <Color>[Colors.pink.withOpacity(0.5), primaryColor],
                        tileMode: TileMode.mirror,
                      ).createShader(bounds);
                    },
                    child: Text(
                      widget.producto.nombre,
                      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  _separador,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Cantidad deseada', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),),
                      DropdownButton(
                        value: _elementoSeleccionado,
                        onChanged: (val) {
                          setState(() {
                            _elementoSeleccionado = val;
                          });
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
                  _separador,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Costo', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),),
                      Text('\$${(widget.producto.precio * _elementoSeleccionado).toDouble()}', style: TextStyle(fontSize: 16.0, color: primaryColor, fontWeight: FontWeight.bold),)
                    ],
                  ),
                  _separador,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _boton(
                        'Aceptar', 
                        Colors.green[400],
                        () {
                          appBloc.pushToCart(widget.producto);
                          appBloc.getTotal();
                          Navigator.pop(context);
                        },
                      ),
                      const SizedBox(width: 25.0),
                      _boton(
                        'Cancelar', 
                        Colors.red[400],
                        () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _boton(String texto, Color color, VoidCallback onTap)  {
    

    return InkWell(
      borderRadius: BorderRadius.circular(30.0),
      splashColor: primaryColor.withOpacity(0.4),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(texto, style: TextStyle(color: color, fontSize: 18.0, fontWeight: FontWeight.w500),),
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