import 'package:flutter/material.dart';
import 'package:my_portfolio/views/home/home_screens.dart';
import 'package:my_portfolio/views/portfolio/portfolio_screen.dart';
import 'base/routes.dart';

class RouteName {
  static const String home = '/home';
  static const String portfolio = '/portfolio';
}

class AppPageRoute extends NavRoute {
  AppPageRoute(String id, {required NavPageBuilder builder, dynamic data})
      : super(id, builder: builder, data: data);

  static AppPageRoute home() => AppWidgetRoute(RouteName.home, builder: homeScreenBuilder);

  static AppPageRoute portfolio() =>
      AppWidgetRoute(RouteName.portfolio, builder: portfolioScreenBuilder);
}

///
class AppWidgetRoute extends AppPageRoute {
  AppWidgetRoute(
    String id, {
    required WidgetBuilder builder,
    dynamic data,
  }) : super(id,
            builder: (context, [dynamic data]) => _widgetToPage(context, id, builder, data),
            data: data);

  static Page _widgetToPage(BuildContext context, String key, WidgetBuilder builder, dynamic data) {
    return MaterialPage(
      child: builder(context),
      key: ValueKey(key),
      name: key,
      arguments: data,
    );
  }
}
