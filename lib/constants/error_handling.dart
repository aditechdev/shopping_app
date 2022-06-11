import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_app/constants/utils.dart';

void httpErrorHandle({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSuccess,
}) {
  switch (response.statusCode) {
    case 200:
      onSuccess();

      break;
    case 400:
      showSnakBar(context, jsonDecode(response.body)['msg']);
      break;
    case 500:
    showSnakBar(context, jsonDecode(response.body)['error']);
      break;

    default:
    showSnakBar(context, response.body);
  }
}
