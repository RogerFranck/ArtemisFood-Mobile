//import 'package:artemisfood/src/static/const.dart';
import 'package:artemisfood/src/model/producto.dart';
import 'package:artemisfood/src/providers/app_bloc.dart';
import 'package:artemisfood/src/static/const.dart';
import 'package:artemisfood/src/widgets/custom_dialog_comment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CartItem extends StatelessWidget {
  final Producto producto;
  const CartItem({Key key, this.producto,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appBloc = Provider.of<AppBloc>(context, listen: false);
    final _color = appBloc.isDarkMode ? Colors.white : Colors.black;

    return Padding(
      padding: const EdgeInsets.only(top: 10.0,),
      child: Slidable(
        actionPane: SlidableStrechActionPane(),
        child: Column(
          children: [
            ListTile(
              contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image(
                  image: NetworkImage(producto.foto),
                  width: 80.0,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                producto.nombre,
                style: GoogleFonts.montserrat(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: _color
                ),
              ),
              subtitle: Text(
                producto.descripcion,
                style: GoogleFonts.montserrat(
                  fontSize: 10.0,
                  color: _color.withOpacity(0.7),
                  fontWeight: FontWeight.w400
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      '\$${producto.precio.toDouble()} MXN',
                      style: GoogleFonts.montserrat(
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0
                      ),
                    ),
                  ),
                  Flexible(
                    child: FittedBox(
                      child: Row(
                        children: [
                          IconButton(
                            splashRadius: 24.0,
                            icon: Icon(Icons.message, size: 30.0, color: _color ),
                            onPressed: () {
                              return showDialog(
                                context: context,
                                builder: (context) {
                                  return CustomDialogComment();
                                }
                              );
                            }
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'X ${producto.cantidad}',
                                style: TextStyle(
                                  fontSize: 24,
                                  color : _color,
                                ),
                              ),
                              SizedBox(width: 5.0,),
                              Text(
                                'quant.',
                                style: TextStyle(
                                  fontSize: 12,
                                  color : _color,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            FractionallySizedBox(
              widthFactor: 0.9,
              child: Divider(
                color: primaryColor,
                thickness: 0.5,
              ),
            ),
          ],
        ),
        secondaryActions: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: IconSlideAction(
              caption: 'Borrar',
              color: Colors.red,
              iconWidget: Image.asset(
                '$iconPath/delete.png',
                width: 30.0,
                height: 35.0,
                color: Colors.white,
              ),
              onTap: () {
                appBloc.deleteInCart(producto);
                appBloc.getTotal();
              }
            ),
          ),
        ],
      ),
    );
  }
  
}



