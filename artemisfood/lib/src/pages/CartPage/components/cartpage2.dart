import 'package:artemisfood/src/components/RoundedButton.dart';
import 'package:artemisfood/src/pages/CartPage/components/cartCards.dart';
import 'package:artemisfood/src/pages/HomePage/components/custom_app_bar.dart';
import 'package:artemisfood/src/static/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CartPage2 extends StatefulWidget {
  @override
  _CartPage2State createState() => _CartPage2State();
}

class _CartPage2State extends State<CartPage2> {
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
            Slidable(
              child: CartCards2(),
              actionPane: SlidableBehindActionPane(),
              secondaryActions: <Widget>[
               Container(
                 height: 100,
                 child: Card(                 
                 child: IconSlideAction(
                   caption: 'Borrar',
                   iconWidget: Image(
                    image: AssetImage('$iconPath/delete.png'),
                    color: Colors.white,
                    width: iconSize,
                    height: iconSize,
                  ),
                   color: Colors.red,
                 ),
               ),
               )
              ],
            ),
             Slidable(
              child: CartCards2(),
              actionPane: SlidableBehindActionPane(),
              secondaryActions: <Widget>[
                IconSlideAction(
                   caption: 'Borrar',
                   iconWidget: Image(
                    image: AssetImage('$iconPath/delete.png'),
                    color: Colors.white,
                    width: iconSize,
                    height: iconSize,
                  ),
                   color: Colors.red,
                 )
              ],
            ),
            //CartCards2(),
            SizedBox(
              height: 220,
            )
          ]))
        ],
      ),
    );
  }
}
