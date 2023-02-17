import 'package:flutter/material.dart';
import 'package:trip_advisor_app/core/constants/navigation/navigation_constants.dart';
import 'package:trip_advisor_app/view/auth/login/view/login_view.dart';

class NavigationRoute {
  NavigationRoute._init();
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.LOGIN_VIEW:
        return normalNavigate(LoginView(), NavigationConstants.LOGIN_VIEW);
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Text("NOT FOUND"),
          ),
        );
    }
  }

  MaterialPageRoute normalNavigate(Widget widget, String pageName) {
    return MaterialPageRoute(
      builder: (context) => widget,
    );
  }
}
