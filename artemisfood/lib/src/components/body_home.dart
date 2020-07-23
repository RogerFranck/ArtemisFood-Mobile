import 'package:artemisfood/src/components/background_home.dart';
import 'package:artemisfood/src/models/lista_comidas.dart';
import 'package:artemisfood/src/static/const.dart';
import 'package:flutter/material.dart';
import 'search_field.dart';

class BodyHome extends StatelessWidget {
  const BodyHome({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BackgroundHome(
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'ArtemisFood',
                      style: primaryStyle,
                    ),
                  ),
                  FlatButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.location_on,
                      color: Colors.white,
                      size: 30.0,
                    ),
                    label: Text(
                      'A208',
                      style: primaryStyle,
                    ),
                  ),
                ],
              ),
              SizedBox( height: 20.0 ),
              SearchField(),
              SizedBox( height: 20.0 ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.favorite,
                      color: Colors.white,
                    ),
                    SizedBox( width: 5.0, ),
                    Text(
                      'Favorites',
                      style: TextStyle( fontWeight: FontWeight.bold, color: Colors.white, fontSize: 22.0 ),
                    ),
                  ],
                ),
              ),
              ListViewFavoritos(),
              ListViewCategories(),
              //ListViewFoodSection(),
              ListFood()
            ],
          ),
        ),
      ),
    );
  }
}

class ListViewCategories extends StatelessWidget {
  const ListViewCategories({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.0,),
      width: size.width,
      height: 150.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: listaComidas.length,
        itemBuilder: (context, index) {
          return CategoriesSection(
            texto: listaComidas[index].nombre,
            imagen: listaComidas[index].imagen,
          );
        },
      ),
    );
  }
}

//List<String> lista = ['Hamburguesas', 'Tacos', 'Tortas', 'Spaghettis', 'Burritos', 'Enchiladas', 'Pizzas'];

class CategoriesSection extends StatelessWidget {
  final String texto;
  final String imagen;
  const CategoriesSection({Key key, @required this.texto, @required this.imagen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      margin: EdgeInsets.only( top: 20.0 ),
      child: Column(
        children: <Widget>[
          CircleAvatar(
            radius: 35.0,
            backgroundImage: NetworkImage(imagen),
          ),
          SizedBox( height: 7.0, ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0,),
            child: Text(
              texto,
              style: TextStyle( fontWeight: FontWeight.bold, ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

class ListViewFavoritos extends StatelessWidget {
  const ListViewFavoritos({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: 250,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: ( context, index ) {
          return ListaFavoritos();
        },
      ),
    );
  }
}

class ListaFavoritos extends StatelessWidget {
  const ListaFavoritos({
    Key key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.88,
      padding: EdgeInsets.symmetric(horizontal: 10.0,),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Image(
              image: NetworkImage('https://s2.best-wallpaper.net/wallpaper/2880x1800/1808/Hamburger-meat-French-fries-fast-food_2880x1800.jpg'),
            ),
          ),
          Positioned(
            bottom: 35,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Container(
                width: size.width * 0.75,
                height: 60.0,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Cheseseburguer',
                            style: primaryTitle,
                          ),
                          Divider(height: 7.0,),
                          Text(
                            'Tomate, cebolla, pepinillos, etc.',
                            style: primarySubtitle,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Text(
                          '100 MXN',
                          style: TextStyle( fontWeight: FontWeight.bold, fontSize: 18.0 ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ListViewFoodSection extends StatelessWidget {
  const ListViewFoodSection({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: 220,
      child: ListView.builder(
        itemCount: listaComidas.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return FoodSection(
            image: listaComidas[index].imagen,
            nombre: listaComidas[index].nombre,
            precio: listaComidas[index].precio,
          );
        },
      ),
    );
  }
}

class FoodSection extends StatelessWidget {
  final String image;
  final String nombre;
  final double precio;
  const FoodSection(
    {
      Key key, 
      this.image, 
      this.nombre, 
      this.precio
    }
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0,),
      //width: 200.0,
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image(
              image: NetworkImage(
                image
              ),
              fit: BoxFit.cover,
              height: 160.0,
            ),
          ),
          SizedBox( height: 8.0, ),
          Container(
            width: 212.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: 120.0,
                  child: Text(
                    nombre,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  '$precio MXN',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FoodItem extends StatelessWidget {
  final String nombre;
  final String imagen;
  final String descripcion;
  final double precio;
  const FoodItem(
      {
    Key key, 
    @required this.nombre, 
    @required this.imagen,
    @required this.descripcion, 
    @required this.precio
    }
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        child: Card(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: ClipRRect(
              //borderRadius: BorderRadius.circular(10.0),
              child: ListTile(
                contentPadding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                title: Text(
                  nombre,
                  style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold
                  ),
                ),
                leading: CircleAvatar(
                  radius: 32.0,
                  backgroundImage: NetworkImage(imagen),
                ),
                subtitle: Text(
                  'Veniam minim tempor eiusmod laboris adipisicing commodo ut.',
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 3.0,
                        color: Colors.teal,
                      )
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        '$precio MXN',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: primaryColor,
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ListFood extends StatelessWidget {
  const ListFood({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: size.height,
      ),
      child: Container(
        width: size.width,
        height: listaComidas.length * 105.0,
        child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: listaComidas.length,
          itemBuilder: (context, index) {
            return FoodItem(
              nombre: listaComidas[index].nombre,
              descripcion: listaComidas[index].descripcion,
              precio: listaComidas[index].precio,
              imagen: listaComidas[index].imagen,
            );
          },
        ),
      ),
    );
  }
}


