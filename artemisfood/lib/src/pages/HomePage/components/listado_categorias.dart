import 'package:artemisfood/src/components/TextButton.dart';
import 'package:flutter/material.dart';

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