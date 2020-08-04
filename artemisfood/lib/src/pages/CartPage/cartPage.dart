import 'package:artemisfood/src/components/RoundedButton.dart';
import 'package:artemisfood/src/pages/CartPage/components/cartCards.dart';
import 'package:artemisfood/src/pages/HomePage/components/custom_app_bar.dart';
import 'package:artemisfood/src/static/const.dart';
import 'package:flutter/material.dart';

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

  String opcionSeleccionada ;
  
  Icon iconoSelect = Icon(Icons.attach_money);

  void _seleccionarIcono(valor){
    if (valor == 'tarjeta'){
      iconoSelect = Icon(Icons.credit_card);
    }
    else{
      iconoSelect = Icon(Icons.attach_money);
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet:Container(
        //constraints: BoxConstraints(maxHeight:200, minHeight: 200,  ),
        height: 220,
        alignment: Alignment.bottomCenter,
        child: Card(
          child: ListView(
            children: <Widget>[
               ListTile(
                 leading: Icon(Icons.monetization_on),
                 title: Text('Cantidad a pagar:'),
                 trailing: Text('\$100'),
               ),
               ListTile(
                 leading: iconoSelect,
                 title: Text('Metodo de pago:'),
                 trailing: DropdownButton(items: _metodoPago, value: opcionSeleccionada, onChanged: (opcion){
                   setState(() {
                     opcionSeleccionada = opcion;
                     _seleccionarIcono(opcion);
                   });
                 }),
                 //trailing:,
               ),
               Container(
                 margin: EdgeInsets.only(bottom: 50),
                 child: Center(
                   child: RoundedButton(hintText: 'Proceder al pago', onPress: (){},),
                 ),
               ),
            ],
          ),
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
            CartCards2(),
            CartCards2(),
            CartCards2(),
            CartCards2(),
            CartCards2(),
            CartCards2(),
            SizedBox(height: 220,)
          ]))
        ],
      ),
    );
  }
}
