import 'package:flutter/material.dart';

class ContainerGroup extends StatelessWidget {
  final String title;
  final Widget child;
  final List<Widget> children;
  final Widget bottom;
  final double width;
  final TextStyle style;
  final EdgeInsetsGeometry padding;
  const ContainerGroup(
      {Key key,
      this.title,
      this.children,
      this.bottom,
      this.child,
      this.width,
      this.style,
      this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
        padding: padding ?? EdgeInsets.all(3),
        width: width,
        child: Column(
          children: [
            Container(
                alignment: Alignment.center,
                color: theme.primaryColor.withAlpha(100),
                width: double.maxFinite,
                height: 20,
                child: Text(title ?? '',
                    style: style ??
                        TextStyle(
                            color: theme.primaryTextTheme.bodyText1.color))),
            Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: theme.dividerColor)),
                margin: EdgeInsets.zero,
                width: double.maxFinite,
                child: Column(children: [
                  if (child != null) child,
                  ...children ?? [],
                  if (bottom != null) bottom
                ])),
          ],
        ));
  }
}
