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
          'content-type': 'application/json; charset=UTF-8',
        },
      );
      httpErrorHandle(
          context: context,
          onSuccess: () {
            showSnakBar(context,
                "Account created Succesfully 🎉 Login with the same credentials!");
          },
          response: response);
    } catch (e) {
      showSnakBar(context, e.toString());
    }
  }
}
