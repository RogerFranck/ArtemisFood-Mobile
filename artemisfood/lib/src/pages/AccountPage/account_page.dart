import 'package:artemisfood/src/components/TextButton.dart';
import 'package:artemisfood/src/components/custom_bottom_body.dart';
import 'package:artemisfood/src/pages/HomePage/components/custom_app_bar.dart';
import 'package:artemisfood/src/providers/app_bloc.dart';
import 'package:artemisfood/src/static/const.dart';
import 'package:artemisfood/src/widgets/return_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appBloc = Provider.of<AppBloc>(context, listen: false);
    const _separador = SizedBox(height: 20.0,);
    
    return Scaffold(
      backgroundColor: appBloc.isDarkMode ? backgroundHomeDark : backgroundHome,
      body: CustomScrollView(
        slivers: [
          CustomAppBar(
            bottomBody: CustomBottomBody(title: 'Account'),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Container(
              child: Padding(
                padding: EdgeInsets.only(top: 40.0),
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          _Title(),
                          _separador,
                          _PedidosAccount(),
                          // _SinPedidos(),
                          _separador,
                          TextButton(
                            color: Colors.red,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                            hintText: 'Eliminar Cuenta',
                            onPress: () {},
                          ),
                        ],
                      ),
                    ),
                    ReturnButton(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SinPedidos extends StatelessWidget {
  const _SinPedidos({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height * 0.35,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: [
            FractionallySizedBox(
              widthFactor: .35,
              child: Image.asset(
                '$imgPath/no_pedidos.png',
                color: Colors.blueGrey,
              ),
            ),
            Text(
              'Usted no tiene ningún pedido en esta cuenta...',
              style: TextStyle(color: Colors.blueGrey, fontSize: 16.0, fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}

class _PedidosAccount extends StatelessWidget {
  const _PedidosAccount({
    Key key,
  });

  @override
  Widget build(BuildContext context) {
    const _iconSize =  29.0;
    final _estiloTexto = TextStyle(fontSize: 12.0, color: primaryColor, fontWeight: FontWeight.w700);

    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Text(
              'Pedidos de la cuenta',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
            ),
          ),
          const SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.35,
              // color: Colors.amber,
              child: ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                physics: BouncingScrollPhysics(),
                itemCount: 8,
                itemBuilder: (_, index) {
                  return ListTile(
                    onTap: () {},
                    leading: Image.asset('$iconPath/receipt.png', width: _iconSize, height: _iconSize,),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Pizza de pepperoni \nTorta...',
                          style: _estiloTexto,
                        ),
                      ],
                    ),
                    trailing: Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            '\$300.0',
                            style: _estiloTexto,
                          ),
                          Text(
                            'Efectivo',
                            style: _estiloTexto,
                          ),
                        ],
                      ),
                    ),
                  );
              }),
            ),
          ),
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FractionallySizedBox(
        widthFactor: 0.8,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Miguel Antonio Fuentes González',
                    style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(60.0),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Icon(
                        Icons.edit,
                        color: primaryColor,size: 20.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.grey,
              thickness: 1,
              height: 14,
            ),
            TextButton(
              color: primaryColor,
              hintText: 'Cambio de contraseña',
              fontWeight: FontWeight.w700,
              fontSize: 14.0,
              onPress: () {},
            ),
          ],
        ),
      ),
    );
  }
}

