import 'package:flutter/material.dart';
import 'package:shopping_app/common/widget/bottom_bar.dart';
import 'package:shopping_app/features/auth/screens/auth_screens.dart';
import 'package:shopping_app/features/home/screens/home_screens.dart';

//! To Generate the route
Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (__) => const AuthScreen(),
      );
      case HomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (__) => const HomeScreen(),
      );
      case BottomBar.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (__) => const BottomBar(),
      );

    default:
      return MaterialPageRoute(
          builder: (__) => const Scaffold(
                body: Center(child: Text("No data")),
              ));
  }
}
