import 'package:flutter/material.dart';

class ShakeTransition extends StatelessWidget {
  final Widget child;
  final Duration duration;
  final double offset;
  final Axis axis;

  const ShakeTransition(
    {
      Key key,
      @required this.child, 
      this.duration = const Duration(milliseconds: 1200), 
      this.offset = 140.0, 
      this.axis = Axis.horizontal,
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
          offset: axis == Axis.horizontal ? Offset(value * offset, 0.0) : Offset(0.0, value * offset),
          child: child,
        );
      }
    );
  }
}