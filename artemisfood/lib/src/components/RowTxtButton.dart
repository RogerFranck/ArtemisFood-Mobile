import 'package:artemisfood/src/components/TextButton.dart';
import 'package:flutter/material.dart';

class RowTxtButton extends StatelessWidget {
  final String hintText;
  final String hintTextButton;
  final Function onPress;
  const RowTxtButton({Key key, this.hintText,this.onPress,this.hintTextButton}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            hintText
          ),
          TextButton(
            hintText: hintTextButton,
            onPress: onPress,
          ),
        ],
      ),
    );
  }
}