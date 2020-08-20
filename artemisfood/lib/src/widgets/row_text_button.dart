import 'package:artemisfood/src/static/const.dart';
import 'package:flutter/material.dart';

class CustomRowTextWithButton extends StatelessWidget {
  const CustomRowTextWithButton({
    Key key,
    this.text = 'New user? ',
    this.buttonText = 'Sign up',
    @required this.onTap,
  }) : super(key: key);

  final String text; 
  final String buttonText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            buttonText,
            style: TextStyle(fontWeight: FontWeight.w500, color: primaryColor),
          ),
        ),
      ],
    );
  }
}