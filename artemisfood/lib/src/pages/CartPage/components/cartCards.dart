//import 'package:artemisfood/src/static/const.dart';
import 'package:artemisfood/src/providers/app_bloc.dart';
import 'package:artemisfood/src/static/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';


class CartCard extends StatelessWidget {
  final String title;
  final String description;
  final String image;
  final int price;
  final int quantity;
  final bool comment;
  const CartCard(
      {Key key,
      this.title,
      this.description,
      this.image,
      this.price,
      this.quantity,
      this.comment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appBloc = Provider.of<AppBloc>(context, listen: false);
    final Color _color = appBloc.isDarkMode ? Colors.white : Colors.black;
    final Color _colorSubtitle = appBloc.isDarkMode ? Colors.white.withOpacity(0.8) : Colors.grey[500];
    
    return Slidable(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Container(
          height: 100,
          decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(20.0),
              // boxShadow: <BoxShadow>[
              //   BoxShadow(
              //       color: Colors.black26,
              //       blurRadius: 10.0,
              //       spreadRadius: 1.0,
              //       offset: Offset(2.0, 10.0)),
              //   ]
              ),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image(
                      image: NetworkImage(image,),
                    )
                  ),
                ),
              ),
              Flexible(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(   
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,               
                    children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(title, maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(
                      fontFamily: 'Avenir',
                      fontSize: 16,
                      color: _color,
                      fontWeight: FontWeight.w700                   
                      ),), 
                    ),
                    Text(description, softWrap: true, maxLines: 2, overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: 'Avenir',
                      fontSize: 11,
                      color: _colorSubtitle,
                    ),),     
                    ],
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 0),                    
                    Padding(
                      padding: const EdgeInsets.only(right : 8.0),
                      child: Text('\$$price MXN', 
                        style: TextStyle(
                          fontFamily: 'Avenir',
                          color: appBloc.isDarkMode ? Colors.white : primaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w700
                        )
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                       Container(                         
                        //  padding: EdgeInsets.all(5),
                         child: getComment(context),
                       ),
                       Container(                         
                         padding: EdgeInsets.all(8),
                         child: Text('X $quantity', 
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            color: appBloc.isDarkMode ? Colors.white : Colors.grey[600],                            
                          ),
                         )
                       ) 
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      actionPane: SlidableBehindActionPane(),
      secondaryActions: [
        Container(
          padding: EdgeInsets.all(10.0),
          height: 100,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: IconSlideAction(
              foregroundColor: appBloc.isDarkMode ? Colors.white : Colors.red,
              caption: 'Borrar',
              iconWidget: Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: Image(
                  image: AssetImage('$iconPath/delete.png'),
                  color: appBloc.isDarkMode ? Colors.white : Colors.red,
                  width: iconSize,
                  height: iconSize,
                ),
              ),
              color: Colors.transparent,
            ),
          ),
        )
      ],
    );
  }

  Widget getComment(BuildContext context) {
    final appBloc = Provider.of<AppBloc>(context, listen: false);
    if (comment){
      return Icon(Icons.comment, color: appBloc.isDarkMode ? Colors.white : Colors.grey[600],);
    }
    else{
      return null;
    }
  }
}

class CartCard2 extends StatelessWidget {
  final String title;
  final String description;
  final String image;
  final int price;
  final int quantity;
  final bool comment;
  const CartCard2(
      {Key key,
      this.title,
      this.description,
      this.image,
      this.price,
      this.quantity,
      this.comment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Container(
          height: 100,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10.0,
                    spreadRadius: 1.0,
                    offset: Offset(2.0, 10.0)),
              ]),
          child: Row(
            children: [
             ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image(image: NetworkImage(image))
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: Column(                
                //mainAxisAlignment: MainAxisAlignment.spc,
                children: [
                  Flexible(
                    flex: 1,
                    child: Row(
                    children: [
                      Container(               
                        alignment: Alignment.centerLeft,                                
                        padding: EdgeInsets.fromLTRB(4, 0, 0,0),
                        child:Text(title, style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 18                   
                            ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(15, 8, 8,8),
                        child: Text('\$${price.toDouble()} MXN', 
                        style: TextStyle(
                          fontFamily: 'Avenir',
                          color: Colors.grey[600],
                          fontSize: 16
                        )
                      )
                      )
                    ],
                  ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Row(
                    children: [
                      Container(
                        width: 160,
                        color: Colors.green,
                        padding: EdgeInsets.fromLTRB(4, 0, 0,0),
                        //padding: EdgeInsets.all(2),
                        child: Text(description, softWrap: true, maxLines: 3, overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 16,                            
                            color: Colors.grey[500]
                          ),
                        ), 
                      ),
                      Container(
                         padding: EdgeInsets.all(5),
                         child: getComment(),
                       ),
                       Container(                         
                         padding: EdgeInsets.all(8),
                         child: Text('X $quantity', 
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            color: Colors.grey[600],                            
                          ),
                         )
                       ) 
                    ],
                  ),
                  )
                ],            
               ),
              )
            ],
          ),
        ),
      ),
      actionPane: SlidableBehindActionPane(),
      secondaryActions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 100,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: IconSlideAction(
                caption: 'Borrar',
                iconWidget: Image(
                  image: AssetImage('$iconPath/delete.png'),
                  color: Colors.white,
                  width: iconSize,
                  height: iconSize,
                ),
                color: Colors.red,
              ),
            ),
          ),
        )
      ],
    );
  }

  getComment() {
    if (comment){
      return Icon(Icons.comment, color: Colors.grey[600],);
    }
    else{
      return SizedBox(width: 24,);
    }
  }
}