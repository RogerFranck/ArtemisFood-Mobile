import 'package:animate_do/animate_do.dart';
import 'package:artemisfood/src/components/TextButton.dart';
import 'package:artemisfood/src/components/custom_bottom_body.dart';
import 'package:artemisfood/src/pages/CartPage/components/cartCards.dart';
import 'package:artemisfood/src/pages/HomePage/components/custom_app_bar.dart';
import 'package:artemisfood/src/providers/app_bloc.dart';
import 'package:artemisfood/src/static/const.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  String _metodoDePago = 'efectivo';
  ValueNotifier<bool> notifierPagoVisible = ValueNotifier(false);
  String opcionSeleccionada;

  @override
  void initState() {
    super.initState();
  }

  int _paresImpares(int number) {
    if (number == 0) {
      return 2;
    } else if (number % 2 == 0) {
      return 2;
    } else {
      return 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    final appBloc = Provider.of<AppBloc>(context, listen: false);
    final Color bgColor =
        appBloc.isDarkMode ? backgroundHomeDark : backgroundHome;

    return Scaffold(
      backgroundColor: bgColor,
      floatingActionButton: notifierPagoVisible.value
          ? null
          : appBloc.carrito.length == 0 ? null : _customFloatingButton(),
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
                      child: appBloc.carrito.length == 0
                          ? _nadaCarrito()
                          : _listadoCarrito(),
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

  Widget _listadoCarrito() {
    final appBloc = Provider.of<AppBloc>(context, listen: false);
    int cont;

    return ListView.builder(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(vertical: 0),
      itemCount: appBloc.carrito.length,
      itemBuilder: (_, index) {
        cont = _paresImpares(index);

        return cont == 2
      ? SlideInLeft(
          delay: Duration(milliseconds: 100 * index),
          child: CartItem(
            producto: appBloc.carrito[index],
          ),
        )
      : SlideInRight(
          delay: Duration(milliseconds: 100 * index),
          child: CartItem(
            producto: appBloc.carrito[index],
          ),
        );
      },
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
          SizedBox(
            height: 20.0,
          ),
          Text(
            'Usted no tiene ningún producto en su carrito...',
            style:
                TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  Widget _pagoPositioned() {
    final appBloc = Provider.of<AppBloc>(context, listen: false);
    final double barSize = (MediaQuery.of(context).size.height * 0.5) + 30;
    final double _iconSize = 45.0;
    final _color = appBloc.isDarkMode ? Colors.white : Colors.black;

    return ValueListenableBuilder<bool>(
        valueListenable: notifierPagoVisible,
        child: Container(
          decoration: BoxDecoration(
              color: appBloc.isDarkMode ? backgroundHomeDark : Colors.white,
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(color: primaryColor, width: 3),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    blurRadius: 10.0,
                    spreadRadius: 2.0,
                    color: Colors.black26,
                    offset: Offset(10, -2.0)),
                BoxShadow(
                    blurRadius: 10.0,
                    spreadRadius: 2.0,
                    color: Colors.black26,
                    offset: Offset(-2.0, 10))
              ]),
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Row(
                      children: [
                        Text(
                          'Tu carrito',
                          style: GoogleFonts.montserrat(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            color: _color,
                          ),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Image.asset(
                          '$imgPath/shopping_cart_cash.png',
                          width: _iconSize - 10,
                          height: _iconSize - 10,
                          color: _color,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Image.asset(
                        '$imgPath/wallet.png',
                        width: _iconSize + 10,
                        height: _iconSize + 10,
                      ),
                      Expanded(
                        flex: 6,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text(
                            'Total a pagar',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Text(
                          '\$${appBloc.total.toDouble()}',
                          style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w800,
                              color: primaryColor),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Image.asset(
                        _metodoDePago == 'efectivo'
                            ? '$imgPath/money.png'
                            : '$imgPath/credit_card.png',
                        width: _iconSize + 10,
                        height: _iconSize + 10,
                      ),
                      Expanded(
                        flex: 6,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text(
                            'Forma de pago',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: DropdownButton(
                          onChanged: (val) {},
                          value: _metodoDePago,
                          items: [
                            DropdownMenuItem(
                              child: Text(
                                'Efectivo',
                                style: TextStyle(
                                    color: primaryColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w800),
                              ),
                              value: 'efectivo',
                              onTap: () {
                                setState(() {
                                  _metodoDePago = 'efectivo';
                                });
                              },
                            ),
                            DropdownMenuItem(
                              child: Text('Tarjeta',
                                  style: TextStyle(
                                      color: primaryColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w800)),
                              value: 'tarjeta',
                              onTap: () {
                                setState(() {
                                  _metodoDePago = 'tarjeta';
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Text(
                        'Tu ubicación'.toUpperCase(),
                        style: TextStyle(
                          fontSize: 40.0,
                          color: appBloc.isDarkMode
                              ? Colors.white.withOpacity(0.03)
                              : Color(0XFFE4E2E2).withOpacity(0.3),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            '$imgPath/user_location.png',
                            width: _iconSize,
                            height: _iconSize,
                          ),
                          SizedBox(width: 10.0),
                          Text(
                            'A208',
                            style: TextStyle(
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold,
                                color: primaryColor),
                          ),
                          SizedBox(width: 10.0),
                          InkWell(
                            onTap: () {},
                            child: Image.asset(
                              '$imgPath/pencil.png',
                              width: _iconSize - 30,
                              height: _iconSize - 30,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: TextButton(
                          hintText: 'Confirmar pedido',
                          fontSize: 18.0,
                          onPress: () {},
                        ),
                      ),
                      Expanded(
                        child: TextButton(
                          hintText: 'Cancelar',
                          color: Colors.red,
                          fontSize: 12.0,
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
            duration: const Duration(milliseconds: 600),
            curve: Curves.bounceOut,
            height: barSize,
            bottom: value ? barSize / 5 : -(barSize + 20),
            left: 10,
            right: 10,
            child: child,
          );
        });
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
