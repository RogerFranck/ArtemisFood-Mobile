import 'package:artemisfood/src/providers/app_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Comentarios extends StatelessWidget {
  const Comentarios({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appBloc = Provider.of<AppBloc>(context, listen: false);
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Container(
          width: MediaQuery.of(context).size.width * 1.0,
          height: 120.0,
          decoration: BoxDecoration(
            color: appBloc.isDarkMode ? Colors.white.withOpacity(0.85) : Colors.white
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              keyboardType: TextInputType.multiline,
              minLines: 1,
              maxLines: 5,
                decoration: InputDecoration(
                hintText: 'Comentario...',
                border: InputBorder.none,
            ),
            ),
          ),
        ),
      ),
    );
  }
}