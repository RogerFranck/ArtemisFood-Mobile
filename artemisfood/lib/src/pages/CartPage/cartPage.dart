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
  
  ValueNotifier<bool> notifierPagoVisible = ValueNotifier(false);
  String opcionSeleccionada;
  Widget iconoSelect = Image(
    image: AssetImage('$iconPath/money.png'),
    width: iconSize,
    height: iconSize,
  );

  // void _seleccionarIcono(valor, BuildContext context) {
  //   final appBloc = Provider.of<AppBloc>(context, listen: false);
  //   final Color _color = appBloc.isDarkMode ? Colors.white : Colors.black;

  //   if (valor == 'tarjeta') {
  //     iconoSelect = Image(
  //       image: AssetImage('$iconPath/credit_card.png'),
  //       width: iconSize,
  //       height: iconSize,
  //       color: _color,
  //     );
  //   } else {
  //     iconoSelect = Image(
  //       image: AssetImage('$iconPath/money.png'),
  //       width: iconSize,
  //       height: iconSize,
  //       color: _color,
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final appBloc = Provider.of<AppBloc>(context, listen: false);

    // List<DropdownMenuItem<String>> _metodoPago = [
    //   DropdownMenuItem(
    //     child: Text('Efectivo', style: TextStyle(color: Colors.white),),
    //     value: 'efectivo',
    //   ),
    //   DropdownMenuItem(
    //     child: Text('Tarjeta', style: TextStyle(color: Colors.white),),
    //     value: 'tarjeta',
    //   )
    // ];

    return Scaffold(
      backgroundColor: appBloc.isDarkMode ? backgroundHomeDark : backgroundHome,
      floatingActionButton: notifierPagoVisible.value ? null : appBloc.carrito.length == 0 ? null: _customFloatingButton(),
      body: CustomScrollView(
        slivers: [
          CustomAppBar(
            bottomBody: CustomBottomBody(title: 'Carrito de compras'),
          ),
          SliverFillRemaining(
            child: Stack(
              children: [
                Column(
                  children: [
                    Expanded(
                      child: appBloc.carrito.length == 0 ? _nadaCarrito() : _listadoCarrito(),
                    ),
                    
                  ],
                ),
                _pagoPositioned()
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
          FractionallySizedBox(
            widthFactor: .5,
            child: Image.asset(
              '$imgPath/cart_disabled.png',
              color: Colors.blueGrey,
            ),
          ),
          SizedBox(height: 20.0,),
          Text(
            'Usted no tiene ningún producto en su carrito...',
            style: TextStyle(
              color: Colors.blueGrey, 
              fontWeight: FontWeight.bold
            ),
          )
        ],
      ),
    );
  }

  Widget _listadoCarrito() {
    final appBloc = Provider.of<AppBloc>(context, listen: false);

    return ListView.builder(
      physics: BouncingScrollPhysics(),
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

  Widget _pagoPositioned() {
    final appBloc = Provider.of<AppBloc>(context, listen: false);
    final double barSize = MediaQuery.of(context).size.height * 0.3;
    final double iconSize = 35.0;

    return ValueListenableBuilder<bool>(
      valueListenable: notifierPagoVisible,
      child: Container(
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
                        width: iconSize,
                        height: iconSize,
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
                          ),
                        ),
                      )
                    ),
                    Expanded(
                      flex: 3,
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
                        width: iconSize,
                        height: iconSize,
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
                          ),
                        ),
                      )
                    ),
                    Expanded(
                      flex: 3,
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
                            notifierPagoVisible.value = false;
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
      builder: (context, value, child) {
        return AnimatedPositioned(
          duration: const Duration(milliseconds: 450),
          bottom: value ? 0 : -barSize,
          left: 0,
          right: 0,
          height: barSize,
          child: child,
        );
      }
    );
  }

  Widget _customFloatingButton() {
      return FloatingActionButton(
        onPressed: () {
          setState(() {
            notifierPagoVisible.value = true;
          });
        },
        child: Image.asset(
          '$imgPath/cart_user.png',
          width: 24.0,
          color: Colors.white,
        ),
        backgroundColor: primaryColor,
      );
    }
}
