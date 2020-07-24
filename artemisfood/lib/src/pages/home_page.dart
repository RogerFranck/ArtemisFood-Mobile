import 'package:artemisfood/src/models/lista_comidas.dart';
import 'package:artemisfood/src/static/const.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xFFF4F3F6),
      body: BodyHomePage(),
      bottomNavigationBar: NavigationBarBottom(),
    );
  }
}

class BodyHomePage extends StatelessWidget {
  const BodyHomePage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BackgroundHome(
        rowBody: CircleAvatar(
          backgroundColor: Colors.black87,
          child: IconButton(
            icon: Icon(
              Icons.notifications,
              color: Color(0xFFFFD600),
            ), 
            onPressed: () {},
          ),
        ),
        bodyColumn: SearchField(),
        bodyHome: BodyHome(),
      ),
    );
  }
}

class BodyHome extends StatelessWidget {
  const BodyHome({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      padding: const EdgeInsets.only(left: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Favoritos',
            style: primaryStyle,
          ),
          SizedBox(
            height: 10.0,
          ),
          ListViewFavorites(),
          Text('wnfqlknfq')
        ],
      ),
    );
  }
}

class ListViewFavorites extends StatelessWidget {
  const ListViewFavorites({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: size.height * 0.25
      ),
      child: Container(
        width: double.infinity,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: listaComidas.length,
          itemBuilder: (context, index) {
            return FavoriteItem(
              imagen: listaComidas[index].imagen,
              nombre: listaComidas[index].nombre,
              precio: listaComidas[index].precio,
            );
          },
        ),
      ),
    );
  }
}

class FavoriteItem extends StatelessWidget {
  final String nombre;
  final double precio;
  final String imagen;
  const FavoriteItem({
    Key key, this.nombre, this.precio, this.imagen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Container(
              width: 250.0,
              height: 150.0,
              child: Image(
                image: NetworkImage(imagen),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: 150.0,
                child: Text(
                  nombre,
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                '$precio MXN',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Color(0xFF4525A4)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Container(
        //margin: EdgeInsets.only(top: 10.0,),
        color: Color(0XFFF5F5F5),
        width: size.width * 0.90,
        height: size.height * 0.07,
        child: TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            icon: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Icon(
                Icons.search,
                size: 30.0,
              ),
            ),
            hintText: 'Search',
            hintStyle: TextStyle( fontSize: 20.0 ),
          ),
        ),
      ),
    );
  }
}

class NavigationBarBottom extends StatelessWidget {
  const NavigationBarBottom({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.10,
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0),),
        child: Container(
          child: BottomNavigationBar(
            iconSize: 30.0,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home
                ),
                title: Container()
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.receipt
                ),
                title: Container()
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person
                ),
                title: Container()
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BackgroundHome extends StatelessWidget {
  final Widget rowBody;
  final Widget bodyColumn;
  final Widget bodyHome;
  const BackgroundHome({Key key, this.rowBody, this.bodyColumn, this.bodyHome}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Column(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.0),),
          child: Container(
            height: size.width * 0.45,
            width: double.infinity,
            color: Colors.white,
            child: SafeArea(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              'Artemis',
                              style: primaryStyle,
                            ),
                            Text(
                              'Food',
                              style: primaryStylePurple,
                            ),
                          ],
                        ),
                        rowBody,
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  bodyColumn,
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        bodyHome,
      ],
    );
  }
}