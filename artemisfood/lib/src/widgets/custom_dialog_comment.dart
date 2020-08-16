import 'package:artemisfood/src/components/TextButton.dart';
import 'package:artemisfood/src/static/const.dart';
import 'package:flutter/material.dart';

class CustomDialogComment extends StatelessWidget {
  const CustomDialogComment({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Container(
        height: 300,
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(20.0) 
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
          child: Column(
            children: [
              Text(
                'Comentario',
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 20.0, fontWeight: FontWeight.bold
                ),
                textAlign: TextAlign.center,
              ),
              TextField(
                keyboardType: TextInputType.multiline,
                minLines: 1,
                maxLines: 7,
                  decoration: InputDecoration(
                  hintText: 'Aquí va el comentario...',
                  hintStyle: TextStyle(fontSize: 14.0),
                  border: InputBorder.none,
                ),
              ),
              Spacer(),
              TextButton(
                hintText: 'Editar',
                color: primaryColor,
                fontSize: 16.0,
                onPress: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}