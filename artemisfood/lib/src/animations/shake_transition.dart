import 'package:flutter/material.dart';

class ShakeTransition extends StatelessWidget {
  final Widget child;
  final Duration duration;
  final double offset;
  final Axis axis;
  final bool reverse;

  const ShakeTransition(
    {
      Key key,
      @required this.child, 
      this.duration = const Duration(milliseconds: 1200), 
      this.offset = 140.0, 
      this.axis = Axis.horizontal,
      this.reverse = false,
    }
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      child: child,
      tween: Tween(begin: 1.0, end: 0.0), 
      duration: duration, 
      curve: Curves.elasticOut,
      builder: (context, value, child) {
        return Transform.translate(
          offset: 
            axis == Axis.horizontal  && reverse == false ? Offset(value * offset, 0.0) 
          : axis == Axis.horizontal  && reverse == true ? Offset( - value * offset, 0.0) 
          : axis == Axis.vertical  && reverse == false  ? Offset(0.0, value * offset)
          : axis == Axis.vertical  && reverse == true  ? Offset(0.0, - value * offset)
          : null,
          child: child,
        );
      }
    );
  }
}