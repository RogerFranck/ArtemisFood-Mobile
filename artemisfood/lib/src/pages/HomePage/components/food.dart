import 'package:artemisfood/src/static/const.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http ;

import 'dart:convert';

class ListViewFood extends StatefulWidget {
  const ListViewFood({
    Key key,
  }) : super(key: key);

  @override
  _ListViewFoodState createState() => _ListViewFoodState();
}

class _ListViewFoodState extends State<ListViewFood> {

  Map data;
  List productdata;

  getProduct() async {
    http.Response res = await http.get('http://192.168.0.15:4000/producto');
    data = json.decode(res.body);
    setState(() {
      productdata = data["Producto"];
    });
  }

  @override
  void initState() {
    super.initState();
    getProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 275.0 * productdata.length,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: productdata.length,
        itemBuilder:  (_, index) {
          return FoodItem(
            imagen: productdata[index]["foto"],
            nombre: productdata[index]["nombre"],
            precio: productdata[index]["precio"],
          );
        }
      ),
    );
  }
}

class FoodItem extends StatelessWidget {
  final String imagen;
  final String nombre;
  final int precio;
  const FoodItem({
    Key key, 
    this.imagen, 
    this.nombre, 
    this.precio,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20),
      child: Container(
        height: 250.0,
        child: FractionallySizedBox(
          widthFactor: 0.9,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  spreadRadius: 1.0,
                  offset: Offset(2.0, 10.0)
                ),
              ],
            ),
            child: Column(
              children: <Widget>[
                FractionallySizedBox(
                  widthFactor: 1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20.0),),
                    child: Container(
                      height: 175.0,
                      child: Image( 
                        image: NetworkImage(imagen),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(
                        flex: 7,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              nombre,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(
                              height: 3.0,
                            ),
                            Text(
                              'Con pepinillos, salsa de tomate, vegetales, etc.',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 10.0
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        flex: 3,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            '\$$precio',
                            style: TextStyle(
                              color: primaryColor,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}