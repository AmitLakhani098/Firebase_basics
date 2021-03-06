import 'package:firebase_basics/ui/views/home/home_view.dart';
import 'package:firebase_basics/ui/views/startup/startup_view.dart';
import 'package:flutter/material.dart';
import 'package:firebase_basics/routes/route_names.dart';
import 'package:firebase_basics/ui/views/login/login_view.dart';
import 'package:firebase_basics/ui/views/signup/signup_view.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: LoginView(),
      );
    case SignUpViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: SignUpView(),
      );
    case HomeViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: HomeView(),
      );
    case StartupViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: StartupView(),
      );
    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}')),
              ));
  }
}

PageRoute _getPageRoute({String routeName, Widget viewToShow}) {
  return MaterialPageRoute(
      settings: RouteSettings(
        name: routeName,
      ),
      builder: (_) => viewToShow);
}
