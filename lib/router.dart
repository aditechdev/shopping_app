import 'package:flutter/material.dart';
import 'package:shopping_app/features/auth/screens/auth_screens.dart';

//! To Generate the route
Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (__) => const AuthScreen(),
      );

    default:
      return MaterialPageRoute(
          builder: (__) => const Scaffold(
                body: Center(child: Text("No data")),
              ));
  }
}
