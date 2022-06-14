import 'package:flutter/material.dart';

class GlobalVariable {
  static const appBarGradient = LinearGradient(colors: [
    Color.fromARGB(255, 29, 201, 192),
    Color.fromARGB(255, 125, 221, 216),
  ], stops: [
    0.5,
    1.0
  ]);

  static const secondaryColor = Color.fromRGBO(255, 153, 0, 1);
  static const backgroundColor = Colors.white;
  static const Color greyBackgroundColor = Color(0xffebecee);
  static const Color selectedNavBarColor = Color.fromARGB(255, 0, 131, 143);
  static const unSelectedNavBarColor = Colors.black87;
}
