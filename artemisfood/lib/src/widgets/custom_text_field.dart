import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key key,
    @required this.onChanged
  }) : super(key: key);

  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: .75,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.3),
          borderRadius: BorderRadius.circular(25.0)
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              icon: Icon(Icons.person, color: Colors.black, size: 30,),
              hintText: 'Usuario',
              hintStyle: TextStyle(fontWeight: FontWeight.w500, color: Colors.grey)
            ),
            onChanged: onChanged,
          ),
        ),
      ),
    );
  }
}