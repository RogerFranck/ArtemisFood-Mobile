import 'package:artemisfood/src/components/title_app_bar.dart';
import 'package:artemisfood/src/providers/app_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget {
  final Widget bottomBody;
  const CustomAppBar({
    Key key, @required this.bottomBody,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final appBloc = Provider.of<AppBloc>(context, listen: false);
    return SliverAppBar(
      automaticallyImplyLeading: false,
      flexibleSpace: FlexibleSpaceBar(
        // title: Text('data'),
        background: Container(),
      ),
      pinned: true,
      title: TitleAppBar(),
      bottom: PreferredSize(
        preferredSize: Size(size.width * 0.9, 60),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: bottomBody,
        ),
      ),
      backgroundColor:  appBloc.isDarkMode ? Colors.black : Colors.white,
      expandedHeight: 130.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(10.0),)
      ),
    );
  }
}