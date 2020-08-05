//import 'package:artemisfood/src/static/const.dart';
import 'package:flutter/material.dart';



class CartCards2 extends StatefulWidget {
  @override
  _CartCards2State createState() => _CartCards2State();
}

class _CartCards2State extends State<CartCards2> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
           color: Colors.white,
           borderRadius: BorderRadius.circular(20.0),
           boxShadow:  <BoxShadow>[
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  spreadRadius: 1.0,
                  offset: Offset(2.0, 10.0)
                ),
              ]
        ),
        child: Center(
          child: ListTile(
          leading: Image(image: NetworkImage('https://cdn.kiwilimon.com/recetaimagen/33550/38940.jpg',)),
        title: Text('Pizza Peperonni'),
        subtitle: Text('Queso, queso y más queso'),
        trailing: Column(
          children: <Widget>[
            //FlatButton(onPressed: (){}, child:Icon(Icons.edit)),
            SizedBox(height: 20,),
            Text('\$100 MXN', style: TextStyle(letterSpacing: 3, color: Colors.grey[600]),)
          ],
        ),
        //trailing: ,
      ),
        ),
    ));
  }
}