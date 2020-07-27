import 'package:flutter/material.dart';

class Comentarios extends StatelessWidget {
  const Comentarios({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Container(
          width: MediaQuery.of(context).size.width * 1.0,
          height: 120.0,
          decoration: BoxDecoration(
            color: Colors.white
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              keyboardType: TextInputType.multiline,
              minLines: 1,
              maxLines: 5,
                decoration: InputDecoration(
                hintText: 'Comentario...',
                border: InputBorder.none,
            ),
            ),
          ),
        ),
      ),
    );
  }
}