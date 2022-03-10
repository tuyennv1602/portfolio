import 'package:flutter/material.dart';
import 'package:my_portfolio/shared/shared.dart';

extension BuildContextExtension on BuildContext {
  void openDrawer() => Scaffold.of(this).openDrawer();

  String t(String key) => key.translate(this);
}
