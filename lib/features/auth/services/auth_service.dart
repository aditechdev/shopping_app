import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_app/constants/env.dart';
import 'package:shopping_app/constants/error_handling.dart';
import 'package:shopping_app/constants/utils.dart';
import 'package:shopping_app/features/home/screens/home_screens.dart';
import 'package:shopping_app/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_app/provider/user_provider.dart';

class AuthService {
  void signUpUser({
    required BuildContext context,
    required String email,
    required String name,
    required String password,
  }) async {
    try {
      User user = User(
        address: '',
        email: email,
        name: name,
        id: '',
        password: password,
        token: '',
        type: '',
      );

      http.Response response = await http.post(
        Uri.parse("$myIPAddress/api/signup"),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      httpErrorHandle(
          context: context,
          onSuccess: () {
            showSnakBar(context,
                "Account created successfulle 🎉 Login with the same credentials!");
          },
          response: response);
    } catch (e) {
      showSnakBar(context, e.toString());
    }
  }

  // Sign IN User
  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      http.Response response = await http.post(
        Uri.parse("$myIPAddress/api/signin"),
        body: jsonEncode({
          "email": email,
          "password": password,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      httpErrorHandle(
          context: context,
          onSuccess: () async {
            print(response.body);
            try {
              // Getting Instance
              SharedPreferences pref = await SharedPreferences.getInstance();
              
              // Saving Data
              Provider.of<UserProvider>(context, listen: false)
                  .setUser(response.body);

              // Setting tokend Data

              await pref.setString(
                  "x-auth-token", jsonDecode(response.body)['token']);
              // Navigate
              Navigator.pushNamedAndRemoveUntil(
                  context, HomeScreen.routeName, (route) => false);
            } catch (e) {
              print(e);
            }
          },
          response: response);
    } catch (e) {
      print(e);
      showSnakBar(context, e.toString());
    }
  }
}
