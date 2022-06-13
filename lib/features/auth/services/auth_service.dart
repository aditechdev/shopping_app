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
          },
          response: response);
    } catch (e) {
      showSnakBar(context, e.toString());
    }
  }

  //! Get User Data
  void getUserData({
    required BuildContext context,
  }) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? token = pref.getString("x-auth-token");

      if (token == null) {
        pref.setString("x-auth-token", '');
      }

      var tokenRes = await http.post(
        Uri.parse("$myIPAddress/isTokenValid"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token!
        },
      );

      var res = jsonDecode(tokenRes.body);
      if (res == true) {
        // get User Data
        http.Response userRes = await http.get(
          Uri.parse("$myIPAddress/"),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': token
          },
        );

        var userProvider = Provider.of<UserProvider>(context, listen: false);

        userProvider.setUser(userRes.body);
      }
    } catch (e) {
      showSnakBar(context, e.toString());
    }
  }
}
