import 'package:flutter/material.dart';

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