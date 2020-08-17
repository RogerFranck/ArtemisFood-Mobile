import 'package:flutter/material.dart';
import 'package:artemisfood/src/static/const.dart';

class SearchField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const SearchField({
    Key key,
    this.onChanged
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(top : 5.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Container(
          width: size.width * 0.9,
          color: Color(0xFFF5F5F5),
          child: TextField(
            style: textFieldStyle,
            decoration: InputDecoration(
              hintText: 'Search',
              hintStyle: TextStyle(color: Colors.grey),
              icon: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Icon(
                  Icons.search,
                  size: 30.0,
                ),
              ),
              border: InputBorder.none
            ),
            onChanged: onChanged,
          ),
        ),
      ),
    );
  }
}