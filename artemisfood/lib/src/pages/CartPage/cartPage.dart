import 'package:artemisfood/src/components/RoundedButton.dart';
import 'package:artemisfood/src/pages/CartPage/components/cartCards.dart';
import 'package:artemisfood/src/pages/HomePage/components/custom_app_bar.dart';
import 'package:artemisfood/src/static/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<DropdownMenuItem<String>> _metodoPago = [
    DropdownMenuItem(
      child: Text('Efectivo'),
      value: 'efectivo',
    ),
    DropdownMenuItem(
      child: Text('Tarjeta'),
      value: 'tarjeta',
    )
  ];

  String opcionSeleccionada;

  Widget iconoSelect = Image(
    image: AssetImage('$iconPath/money.png'),
    width: iconSize,
    height: iconSize,
  );

  void _seleccionarIcono(valor) {
    if (valor == 'tarjeta') {
      iconoSelect = Image(
        image: AssetImage('$iconPath/credit_card.png'),
        width: iconSize,
        height: iconSize,
      );
    } else {
      iconoSelect = Image(
        image: AssetImage('$iconPath/money.png'),
        width: iconSize,
        height: iconSize,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
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
                ),
                Text('Cantidad a Pagar',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey[600],
                        fontFamily: 'Avenir')),
                SizedBox(
                  width: 60,
                ),
                Text('\$100',
                    style: TextStyle(
                        fontSize: 20, color: Colors.grey[600], fontFamily: '')),
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
                        color: Colors.grey[600],
                        fontFamily: 'Avenir')),
                SizedBox(
                  width: 25,
                ),
                DropdownButton(
                    items: _metodoPago,
                    value: opcionSeleccionada,
                    onChanged: (opcion) {
                      setState(() {
                        opcionSeleccionada = opcion;
                        _seleccionarIcono(opcion);
                      });
                    })
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
            bottomBody: Padding(
              padding: const EdgeInsets.only(),
              child: Text(
                'Carrito de Compras',
                style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 22.0),
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            CartCard(
              image: 'https://cdn.kiwilimon.com/recetaimagen/33550/38940.jpg',
              title: 'Pizza Peperonni',
              description: 'Queso, Peperonni, harina, huevos y no sé que más',
              price: 100,
              quantity: 3,
              comment: true,
            ),
            CartCard2(
              image: 'https://cdn.kiwilimon.com/recetaimagen/33550/38940.jpg',
              title: 'Pizza Peperonni',
              description: 'Queso, Peperonni, harina, huevos y no sé que más',
              price: 100,
              quantity: 3,
              comment: true,
            ),
            CartCard2(
              image: 'https://cdn.kiwilimon.com/recetaimagen/33550/38940.jpg',
              title: 'Pizza Peperonni',
              description: 'Queso, Peperonni, harina, huevos y no sé que más',
              price: 100,
              quantity: 3,
              comment: false,
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
