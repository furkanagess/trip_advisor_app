import 'package:flutter/material.dart';
import 'package:trip_advisor_app/core/constants/navigation/navigation_constants.dart';

class NavigationRoute {
  static NavigationRoute? _instance;
  static NavigationRoute get instance {
    if (_instance != null) return _instance!;

    _instance = NavigationRoute._init();
    return _instance!;
  }

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.ONBOARD:
        return normalNavigate(
          Scaffold(),
        );
    }
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        body: Text("NOT FOUND"),
      ),
    );
  }
}

MaterialPageRoute normalNavigate(Widget widget) {
  return MaterialPageRoute(
    builder: (context) => widget,
  );
}
