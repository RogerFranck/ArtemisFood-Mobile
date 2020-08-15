import 'package:artemisfood/src/components/RoundedButton.dart';
import 'package:artemisfood/src/components/TextButton.dart';
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
  bool _mostrarPago = false;
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
      floatingActionButton: _mostrarPago ? null : appBloc.carrito.length == 0 ? null: _customFloatingButton(),
      body: CustomScrollView(
        slivers: [
          CustomAppBar(
            bottomBody: CustomBottomBody(title: 'Carrito de compras'),
          ),
          SliverFillRemaining(
            child: Column(
              children: [
                Expanded(
                  child: appBloc.carrito.length == 0 ? _nadaCarrito() : _listadoCarrito(),
                ),
                _mostrarPago ? _pago() : Container(),
              ],
            ),
          ),
        ],
      ),
    );

  }
  Widget _nadaCarrito() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            '$imgPath/sad_shopping_cart.png',
            color: Colors.blueGrey,
          ),
          Text(
            'Usted no tiene ningún producto en su carrito...',
            style: TextStyle(color: Colors.blueGrey),
          )
        ],
      ),
    );
  }

  Widget _listadoCarrito() {
    final appBloc = Provider.of<AppBloc>(context, listen: false);

    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 0),
      itemCount: appBloc.carrito.length,
      itemBuilder: (_, index) {
      return CartCard(
        title: appBloc.carrito[index].nombre,
        description: appBloc.carrito[index].descripcion,
        image: appBloc.carrito[index].foto,
        quantity: appBloc.carrito[index].cantidad,
        price: appBloc.carrito[index].precio,
        comment: true,
      );
    });
  }

  Widget _pago() {
    final appBloc = Provider.of<AppBloc>(context, listen: false);

    return Align(
      alignment: Alignment.bottomCenter,
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            decoration: BoxDecoration(
              color: appBloc.isDarkMode ? backgroundHomeDark : Colors.white,
              border: Border(
                top: BorderSide(color: primaryColor),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Image.asset(
                            '$iconPath/wallet.png',
                            width: 40,
                            height: 40,
                            color: appBloc.isDarkMode ? Colors.white : Colors.black,
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              'Cantidad a pagar',
                              style: TextStyle(
                                color: appBloc.isDarkMode ? Colors.white : Colors.black,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          )
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            '\$100.00',
                            style: TextStyle(
                                color: appBloc.isDarkMode ? Colors.white : primaryColor,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold
                              ),
                          )
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Image.asset(
                            '$iconPath/money.png',
                            width: 40,
                            height: 40,
                            color: appBloc.isDarkMode ? Colors.white : Colors.black,
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              'Método de pago',
                              style: TextStyle(
                                color: appBloc.isDarkMode ? Colors.white : Colors.black,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          )
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            '\$100.00',
                            style: TextStyle(
                                color: appBloc.isDarkMode ? Colors.white : primaryColor,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold
                              ),
                          )
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: TextButton(
                            hintText: 'Realizar pedido',
                            fontSize: 20.0,
                            onPress: () {},
                          ),
                        ),
                        Expanded(
                          child: TextButton(
                            hintText: 'Cancelar',
                            fontSize: 15.0,
                            color: Colors.red,
                            onPress: () {
                              setState(() {
                                _mostrarPago = false;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _customFloatingButton() {
      return FloatingActionButton(
        onPressed: () {
          setState(() {
            _mostrarPago ? _mostrarPago = false : _mostrarPago = true;
          });
        },
        child: Icon(
          Icons.shopping_cart
        ),
        backgroundColor: primaryColor,
      );
    }
}
