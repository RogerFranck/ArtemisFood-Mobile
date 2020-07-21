import 'package:artemisfood/src/components/categories.dart';
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
          Category(),
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



