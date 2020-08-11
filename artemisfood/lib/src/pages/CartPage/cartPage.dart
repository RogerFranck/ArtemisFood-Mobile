import 'package:artemisfood/src/components/RoundedButton.dart';
import 'package:artemisfood/src/components/custom_bottom_body.dart';
import 'package:artemisfood/src/pages/CartPage/components/cartCards.dart';
import 'package:artemisfood/src/pages/HomePage/components/custom_app_bar.dart';
import 'package:artemisfood/src/providers/app_bloc.dart';
import 'package:artemisfood/src/static/const.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  

  String opcionSeleccionada;

  Widget iconoSelect = Image(
    image: AssetImage('$iconPath/money.png'),
    width: iconSize,
    height: iconSize,
  );

  void _seleccionarIcono(valor, BuildContext context) {
    final appBloc = Provider.of<AppBloc>(context, listen: false);
    final Color _color = appBloc.isDarkMode ? Colors.white : Colors.black;

    if (valor == 'tarjeta') {
      iconoSelect = Image(
        image: AssetImage('$iconPath/credit_card.png'),
        width: iconSize,
        height: iconSize,
        color: _color,
      );
    } else {
      iconoSelect = Image(
        image: AssetImage('$iconPath/money.png'),
        width: iconSize,
        height: iconSize,
        color: _color,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final appBloc = Provider.of<AppBloc>(context, listen: false);
    final Color _color = appBloc.isDarkMode ? Colors.white : Colors.black;
    final Color _colorText = appBloc.isDarkMode ? Colors.white.withOpacity(0.9) : Colors.grey[600];
    List<DropdownMenuItem<String>> _metodoPago = [
      DropdownMenuItem(
        child: Text('Efectivo', style: TextStyle(color: Colors.white),),
        value: 'efectivo',
      ),
      DropdownMenuItem(
        child: Text('Tarjeta', style: TextStyle(color: Colors.white),),
        value: 'tarjeta',
      )
    ];

    return Scaffold(
      backgroundColor: appBloc.isDarkMode ? backgroundHomeDark : backgroundHome,
      bottomSheet: Container(
        decoration: BoxDecoration(
          color: appBloc.isDarkMode ? backgroundHomeDark : Colors.white,
          border: Border(
            top: BorderSide(
              color: Colors.transparent
            ),
          ),
        ),
        //constraints: BoxConstraints(maxHeight:200, minHeight: 200,  ),
        height: 220,
        alignment: Alignment.bottomCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Image(
                  image: AssetImage('$iconPath/wallet.png'),
                  width: iconSize,
                  height: iconSize,
                  color: _color,
                ),
                Text('Cantidad a Pagar',
                    style: TextStyle(
                        fontSize: 20,
                        color: _colorText,
                        fontFamily: 'Avenir')),
                SizedBox(
                  width: 60,
                ),
                Text('\$100',
                    style: TextStyle(
                        fontSize: 20, color: primaryColor, fontFamily: '')),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                iconoSelect,
                Text('Método de Pago',
                    style: TextStyle(
                        fontSize: 20,
                        color: _colorText,
                        fontFamily: 'Avenir')),
                SizedBox(
                  width: 25,
                ),
                DropdownButton(
                  dropdownColor: primaryColor,
                  items: _metodoPago,
                  value: opcionSeleccionada,
                  onChanged: (opcion) {
                    setState(() {
                      opcionSeleccionada = opcion;
                      _seleccionarIcono(opcion, context);
                    });
                  }
                )
              ],
            ),
            RoundedButton(
              hintText: 'Proceder al pago',
              onPress: () {},
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          CustomAppBar(
            bottomBody: CustomBottomBody(title: 'Carrito de Compras')
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            CartCard(
              image: 'https://cdn.kiwilimon.com/recetaimagen/33550/38940.jpg',
              title: 'Pizza de Peperonni',
              description: 'Queso, Peperonni, harina, huevos y no sé que más',
              price: 100,
              quantity: 3,
              comment: true,
            ),
            CartCard(
              image: 'https://cdn.kiwilimon.com/recetaimagen/33550/38940.jpg',
              title: 'Pizza de Peperonni',
              description: 'Queso, Peperonni, harina, huevos y no sé que más',
              price: 100,
              quantity: 3,
              comment: true,
            ),
            CartCard(
              image: 'https://cdn.kiwilimon.com/recetaimagen/33550/38940.jpg',
              title: 'Pizza de Peperonni',
              description: 'Queso, Peperonni, harina, huevos y no sé que más',
              price: 100,
              quantity: 3,
              comment: true,
            ),
            CartCard(
              image: 'https://cdn.kiwilimon.com/recetaimagen/33550/38940.jpg',
              title: 'Pizza de Peperonni',
              description: 'Queso, Peperonni, harina, huevos y no sé que más',
              price: 100,
              quantity: 3,
              comment: true,
            ),//CartCard//CartCards2(),
            SizedBox(
              height: 220,
            )
          ]))
        ],
      ),
    );
  }
}
