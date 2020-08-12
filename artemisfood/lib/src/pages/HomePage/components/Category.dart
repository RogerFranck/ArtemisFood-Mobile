import 'package:artemisfood/src/providers/app_bloc.dart';
import 'package:artemisfood/src/static/const.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryTitle extends StatelessWidget {
  final List category;
  const CategoryTitle({Key key, this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appBloc = Provider.of<AppBloc>(context, listen: false);
    return Container(
      height: 20,
      width: category.length * 100.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: category.length,
        itemBuilder: (_, index) {
          return InkWell(
            onTap: () {
              print(category);
              appBloc.onCategoryUpdated(category, index);
              print(appBloc.selected);
            },
            splashColor: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 25),
              child: Text(
                category[index],
                style: TextStyle(
                   color:  appBloc.selected == category[index] ? primaryColor : appBloc.isDarkMode ? Colors.white : Colors.black.withOpacity(0.6),
                   fontWeight: appBloc.selected == category[index] ? FontWeight.bold : null,
                )
              ),
            ),
          );
        }
      ),
    );
  }
}