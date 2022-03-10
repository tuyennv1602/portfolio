import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget largeScreen;
  final Widget Function(BuildContext context, BoxConstraints constraints, Widget child)? builder;
  final Widget? mediumScreen;
  final Widget? smallScreen;

  const ResponsiveWidget({
    Key? key,
    required this.largeScreen,
    this.mediumScreen,
    this.smallScreen,
    this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext _) {
    return LayoutBuilder(
      builder: (context, constraints) {
        Widget? _child;
        if (constraints.maxWidth > 1200) {
          _child = largeScreen;
        } else if (constraints.maxWidth <= 1200 && constraints.maxWidth >= 800) {
          _child = mediumScreen ?? largeScreen;
        } else {
          _child = smallScreen ?? largeScreen;
        }
        return builder?.call(context, constraints, _child) ?? _child;
      },
    );
  }
}
