import 'package:flutter/material.dart';

class AppCircleButton extends StatelessWidget {
  const AppCircleButton(
      {Key?key,
      required this.child,
      this.color,
      this.onTap,
      this.width = 60}):super(key: key);

  final Widget child;
  final Color? color;
  final double width;
 final VoidCallback ?onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      clipBehavior: Clip.hardEdge,
      shape:  CircleBorder(),
      child: InkWell(
        child: Icon(Icons.arrow_forward),
        onTap: onTap,
      ),
    );
  }
}


class AppCircleButton2 extends StatelessWidget {
  const AppCircleButton2(
      {Key?key,
      required this.child,
      this.color,
      this.onTap,
      this.width = 60}):super(key: key);

  final Widget child;
  final Color? color;
  final double width;
 final VoidCallback ?onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      clipBehavior: Clip.hardEdge,
      shape:  CircleBorder(),
      child: InkWell(
        child: Icon(Icons.menu),
        onTap: onTap,
      ),
    );
  }
}
