import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shopping_app/constants/env.dart';
import 'package:shopping_app/constants/error_handling.dart';
import 'package:shopping_app/constants/utils.dart';
import 'package:shopping_app/models/user.dart';
import 'package:http/http.dart' as http;

class AuthService {
  void signUpUser({
    required BuildContext context,
    required String email,
    required String name,
    required String password,
  }) async {
    try {
      User user = User("", name, email, password, "", "", "");
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
          onSuccess: () {
            print(response.body);
          },
          response: response);
    } catch (e) {
      showSnakBar(context, e.toString());
    }
  }
}
