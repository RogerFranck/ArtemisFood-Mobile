import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child; //Esto me va a servir para escribir el contenido de la pantalla
  const Background({Key key, @required this.child}) : super(key: key); //Osea que esta clase requuiere un widget como hijo
//Perame voy a hacer una cosita, para que no se vaya a ver qlero
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; //Sacar las dimensiones del dispositivo (altura y anchura)
    return Container(
      width: size.width, //Agarra toda la anchura o puede ser double.infinity
      height: size.height,
      child: Stack( //Cada objeto va sobre otro, igual hay otro stack, que es el titulo y el fondo
        //no recuerdo bien, solo recuerdo que me llevó como 1 hora xd
        children: <Widget>[
          Stack( //Esto es para poner el titulo encima del fondo
            alignment: Alignment.center, //Todos mis objetos cuando los ponga irán al centro
            children: <Widget>[
              Positioned(
                //top: 0, //osea comienza en el pixel 0 de la parte de arriba
                child: Image.asset('lib/assets/img/bg_top.png'), //La imagen gorda
                //height: size.height * 0.35, //determinamos su tamaño
              ),
              Container( //Contenedor del tec
                width: size.width,
                //height: size.height,
                margin: EdgeInsets.only( right: size.width * 0.15, ), //margen a la derecha
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text( //deja experimento con algo, chingada madre no quiere nomas xd, se fue
                      'Artemis\n     Food',
                      style: TextStyle( fontWeight: FontWeight.bold, fontSize: 41.0, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: size.height * 0.26,
            child: Image.asset('lib/assets/img/bg_top_left.png'), //La imagen pequeña
          ),
          child,
        ],
      ),
    );
  }
}