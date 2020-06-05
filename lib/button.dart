import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Function() onPressed;
  final double radius;
  final Color color;
  final Widget child;
  final double width;
  final bool border;
  const Button(
      {Key key,
      this.text,
      this.child,
      this.width,
      this.onPressed,
      this.radius = 15,
      this.style,
      this.border = true,
      this.color})
      : assert(text != null || child != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      width: width,
      child: FlatButton(
          color: color ?? theme.primaryColor.withAlpha(30),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
              side: (border) ? BorderSide(color: theme.dividerColor) : null),
          onPressed: onPressed,
          child: child ?? Text(text ?? 'Ops NULL', style: style)),
    );
  }
}
