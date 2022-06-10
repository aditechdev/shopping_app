import 'package:flutter/material.dart';
import 'package:shopping_app/constants/global_variable.dart';
import 'package:shopping_app/features/auth/screens/auth_screens.dart';
import 'package:shopping_app/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopping App Clone ',
      theme: ThemeData(
        scaffoldBackgroundColor: GlobalVariable.backgroundColor,
        colorScheme: const ColorScheme.light(
          primary: GlobalVariable.secondaryColor,
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: const AuthScreen(),
    );
  }
}
