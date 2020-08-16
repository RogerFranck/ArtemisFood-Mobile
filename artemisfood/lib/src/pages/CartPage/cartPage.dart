import 'package:artemisfood/src/components/TextButton.dart';
import 'package:artemisfood/src/components/custom_bottom_body.dart';
import 'package:artemisfood/src/model/producto.dart';
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
  
  String _metodoDePago = 'efectivo';
  ValueNotifier<bool> notifierPagoVisible = ValueNotifier(false);
  String opcionSeleccionada;
  Widget iconoSelect = Image(
    image: AssetImage('$iconPath/money.png'),
    width: iconSize,
    height: iconSize,
  );
  double _total = 0.00;

  @override
  void initState() { 
    setState(() {
      _total = _getTotal(Provider.of<AppBloc>(context, listen: false).carrito);
    });
    super.initState();
  }

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
                    // Expanded(
                    //   child: appBloc.carrito.length == 0 ? _nadaCarrito() : _listadoCarrito(),
                    // ),
                    Expanded(
                      child: appBloc.carrito.length == 0 ? _nadaCarrito() : _listadoCarrito2(),
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

  Widget _listadoCarrito2() {
    final appBloc = Provider.of<AppBloc>(context, listen: false);

    return ListView.builder(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(vertical: 0),
      itemCount: appBloc.carrito.length,
      itemBuilder: (_, index) {
        return CartItem(
          producto: appBloc.carrito[index],
        );
      }
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

  Widget _pagoPositioned() {
    final appBloc = Provider.of<AppBloc>(context, listen: false);
    final _color = appBloc.isDarkMode ? Colors.white : Colors.black;
    final double barSize = MediaQuery.of(context).size.height * 0.5;
    final double iconSize = 35.0;

    return ValueListenableBuilder<bool>(
      valueListenable: notifierPagoVisible,
      child: Container(
        decoration: BoxDecoration(
          color: appBloc.isDarkMode ? backgroundHomeDark : Colors.white,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: <BoxShadow>[
            BoxShadow(
              blurRadius: 10.0,
              spreadRadius: 2.0,
              color: Colors.black26,
              offset: Offset(10, 2.0)
            ),
            BoxShadow(
              blurRadius: 10.0,
              spreadRadius: 2.0,
              color: Colors.black26,
              offset: Offset(2.0, 10)
            )
          ] 
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
                        '\$$_total',
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
                        _metodoDePago == 'efectivo' ? '$iconPath/money.png' : '$iconPath/credit_card.png',
                        width: iconSize,
                        height: iconSize,
                        color: _color,
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          'Método de pago',
                          style: TextStyle(
                            color: _color,
                            fontSize: 18.0,
                          ),
                        ),
                      )
                    ),
                    Expanded(
                      flex: 3,
                      child: DropdownButton(
                        dropdownColor: appBloc.isDarkMode ? Colors.blueGrey : null,
                        isExpanded: true,
                        value: _metodoDePago,
                        onChanged: (val) {},
                        items: [
                          DropdownMenuItem(
                            child: Text('Efectivo', style: TextStyle(color: _color),),
                            onTap: () {
                              setState(() {
                                _metodoDePago = 'efectivo';
                              });
                            },
                            value: 'efectivo',
                          ),
                          DropdownMenuItem(
                            value: 'tarjeta',
                            child: Text('Tarjeta', style: TextStyle(color: _color)),
                            onTap: () {
                              setState(() {
                                _metodoDePago = 'tarjeta';
                              });
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(
                      '$iconPath/location_user.png',
                      width: iconSize,
                      height: iconSize,
                      color: _color,
                    ),
                    Row(
                      children: [
                        Text(
                          'A208',
                          style: TextStyle(
                            color: _color,
                            fontSize: 18.0,
                          ),
                        ),
                        SizedBox(width: 10.0),
                        InkWell(
                          onTap: () {},
                          child: Image.asset(
                            '$iconPath/edit.png',
                            width: iconSize / 3,
                            height: iconSize / 3,
                            color: _color,
                          ),
                        )
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
          duration: const Duration(milliseconds: 600),
          curve: Curves.bounceOut,
          bottom: value ? barSize / 5 : -( barSize + 20 ),
          left: 20,
          right: 20,
          height: barSize,
          child: child,
        );
      }
    );
  }

  double _getTotal(List<Producto> carrito) {
    double _suma = 0.00;

    for (var i = 0; i < carrito.length; i++) {
      _suma = _suma + carrito[i].precio;
    }
    return _suma;
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
