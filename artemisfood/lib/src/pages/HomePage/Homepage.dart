import 'package:artemisfood/src/components/TextButton.dart';
import 'package:artemisfood/src/static/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: backgroundHome,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            flexibleSpace: FlexibleSpaceBar(
              title: Text('data'),
              background: Container(
                
              ),
            ),
            pinned: true,
            title: TitleAppBar(),
            bottom: PreferredSize(
              preferredSize: Size(size.width * 0.9, 60),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: SearchField(),
              ),
            ),
            backgroundColor: Colors.white,
            expandedHeight: 130.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(10.0),)
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
                  child: Text(
                    'Favoritos',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20.0
                    ),
                  ),
                ),
                ListViewFavorites(),
                SizedBox(
                  height: 10.0,
                ),
                ListViewCategorias(),
                BordeSeparador(),
                ListViewFood(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ListViewFood extends StatelessWidget {
  const ListViewFood({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 10 * 275.0,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) {
          return FoodItem();
        },
      ),
    );
  }
}

class FoodItem extends StatelessWidget {
  const FoodItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.0, left: 20.0, right: 20.0,),
      child: Container(
        height: 250.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              spreadRadius: 2.0,
              offset: Offset(2.0, 10.0)
            ),
          ],
        ),
        child: Column(
          children: <Widget>[
            FractionallySizedBox(
              widthFactor: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(10.0),),
                child: Container(
                  height: 175.0,
                  child: Image(
                    image: NetworkImage('https://s2.best-wallpaper.net/wallpaper/2880x1800/1808/Hamburger-meat-French-fries-fast-food_2880x1800.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Hamburguesa',
                        style: TextStyle(
                          fontSize: 16.0
                        ),
                      ),
                      Text(
                        'Pepinillos, cebolla, etc.',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 11.0,
                        ),
                      )
                    ],
                  ),
                  Text(
                    '100 MXN',
                    style: TextStyle(fontWeight: FontWeight.bold, color: primaryColor, fontSize: 15.0),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BordeSeparador extends StatelessWidget {
  const BordeSeparador({
    Key key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 25.0, left: 25.0, top: 15.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 0.5,
        )
      ),
    );
  }
}

class ListViewCategorias extends StatelessWidget {
  const ListViewCategorias({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: 10.0,
        maxHeight: 30.0
      ),
      child: Container(
        width: double.infinity,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            return TextButton(
              hintText: 'Categorías',
              color: Colors.black,
              fontWeight: FontWeight.w300,
              fontSize: 20.0,
              onPress: () {},
            );
          },
        ),
      ),
    );
  }
}

class ListViewFavorites extends StatelessWidget {
  const ListViewFavorites({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: 200.0,
        maxHeight: 225.0
      ),
      child: Container(
        width: double.infinity,
        //height: 200.0,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 6,
          itemBuilder: (context, index) {
            return FavoriteItem();
          },
        ),
      ),
    );
  }
}

class FavoriteItem extends StatelessWidget {
  const FavoriteItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  spreadRadius: 1.0,
                  offset: Offset(4.0, 7.0)
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Container(
                height: 175.0,
                child: Image(
                  image: NetworkImage('https://s2.best-wallpaper.net/wallpaper/2880x1800/1808/Hamburger-meat-French-fries-fast-food_2880x1800.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            width: 250.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Hamburguesa',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
                ),
                Text(
                  '100 MXN',
                  style: TextStyle(fontWeight: FontWeight.bold, color: primaryColor, fontSize: 15.0),
                )
              ],
            ),
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
        width: size.width * 0.9,
        color: Color(0xFFF5F5F5),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Search',
            icon: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Icon(
                Icons.search,
                size: 30.0,
              ),
            ),
            border: InputBorder.none
          ),
        ),
      ),
    );
  }
}

class TitleAppBar extends StatelessWidget {
  const TitleAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(
              'Artemis',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black,),
            ),
            Text(
              'Food',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: primaryColor,),
            ),
          ],
        ),
        CircleAvatar(
          radius: 20.0,
          backgroundColor: Colors.black87,
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications,
              color: Colors.yellow,
            ),
          ),
        ),
      ],
    );
  }
}