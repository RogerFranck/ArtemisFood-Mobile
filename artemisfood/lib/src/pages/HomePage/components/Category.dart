import 'package:artemisfood/src/static/const.dart';
import 'package:flutter/material.dart';

class CategoryTitle extends StatelessWidget {
  final String title;
  final bool active;
  const CategoryTitle({
    Key key,
    this.active = false,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 25),
      child: Text(
        title,
        style: Theme.of(context).textTheme.button.copyWith(
          color: active ? primaryColor : Colors.black.withOpacity(.4),
        ),
      ),
    );
  }
}