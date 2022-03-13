import 'package:flutter/material.dart';
import 'package:my_portfolio/shared/shared.dart';

extension BuildContextExtension on BuildContext {
  void openDrawer() => Scaffold.of(this).openDrawer();

  bool get isOpeningDrawer => Scaffold.of(this).isDrawerOpen;

  String t(String key) => key.translate(this);

  double getSize({required double small, required double large, double? medium}) {
    if (ResponsiveUtil.isSmallScreen(this)) {
      return small;
    }
    if (ResponsiveUtil.isMediumScreen(this)) {
      return medium ?? large;
    }
    return large;
  }
}
