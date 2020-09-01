import 'package:flutter/material.dart';

class CustomPasswordField extends StatelessWidget {
  const CustomPasswordField({
    Key key,
    @required this.onChanged,
    @required this.onPressed,
    @required this.isVisible,
  }) : super(key: key);

  final ValueChanged<String> onChanged;
  final VoidCallback onPressed;
  final bool isVisible;

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
            obscureText: isVisible,
            decoration: InputDecoration(
              border: InputBorder.none,
              icon: Icon(Icons.lock, color: Colors.black, size: 30,),
              hintText: 'Contraseña',
              hintStyle: TextStyle(fontWeight: FontWeight.w500, color: Colors.grey),
              suffixIcon: IconButton(
                icon: Icon(isVisible ? Icons.visibility : Icons.visibility_off, color: Colors.black, size: 30,), onPressed: onPressed
              )
            ),
            onChanged: onChanged,
          ),
        ),
      ),
    );
  }
}