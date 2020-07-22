import 'package:artemisfood/src/static/const.dart';
import 'package:artemisfood/src/static/lista_temporal_categorias.dart';
import 'package:flutter/material.dart';
import 'search_field.dart';

class BodyHome extends StatelessWidget {
  const BodyHome({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
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
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
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
          ListFood(),
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
      padding: EdgeInsets.symmetric(horizontal: 10.0),
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

class ListViewCategories extends StatelessWidget {
  const ListViewCategories({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.0,),
      width: size.width,
      height: 130.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: listaCategorias.length,
        itemBuilder: (context, index) {
          return CategoriesSection(
            imagen: listaCategorias[index].imagen,
            nombre: listaCategorias[index].nombre,
          );
        },
      ),
    );
  }
}

class CategoriesSection extends StatelessWidget {
  final String imagen;
  final String nombre;
  const CategoriesSection({Key key, @required this.imagen, @required this.nombre}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      margin: EdgeInsets.only( top: 10.0, ),
      child: Column(
        children: <Widget>[
          CircleAvatar(
            radius: 35.0,
            backgroundImage: NetworkImage(imagen),
          ),
          SizedBox( height: 7.0 ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0,),
            child: Text(
              nombre,
              style: TextStyle( fontWeight: FontWeight.bold ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

class ListFood extends StatelessWidget {
  const ListFood({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 5,
        itemBuilder: ( context, index ) {
          return FoodItem();
        },
      ),
    );
  }
}

class FoodItem extends StatelessWidget {
  const FoodItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListTile(
            title: Text(
              'Pizza',
              style: TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.bold
              ),
            ),
            leading: CircleAvatar(
              radius: 25.0,
                      backgroundImage: NetworkImage('https://placeralplato.com/files/2016/01/Pizza-con-pepperoni.jpg'),
                    ),
                    subtitle: Text(
                      "Pizza de peporina al carbon de artemis"
                    ),
                    trailing: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "100 MXN",
                          ),
                        ),
                      ),
                    ),
                  ),
        )
        ),
      );
  }
}

