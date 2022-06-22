import 'dart:convert';
import 'dart:io';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/constants/env.dart';
import 'package:shopping_app/constants/error_handling.dart';
import 'package:shopping_app/constants/utils.dart';
import 'package:shopping_app/models/product.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_app/provider/user_provider.dart';

class AdminServices {
  void sellProduct({
    required BuildContext context,
    required String name,
    required String description,
    required double price,
    required double quantity,
    required String category,
    required List<File> images,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      final cloudinary =
          CloudinaryPublic(cloudinaryCloudName, cloudinaryUnsignedUploadPreset);
      List<String> imageUrls = [];
      for (var i = 0; i < images.length; i++) {
        CloudinaryResponse res = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(images[i].path, folder: name),
        );
        imageUrls.add(res.secureUrl);
      }

      Product product = Product(
          category: category,
          description: description,
          images: imageUrls,
          name: name,
          price: price,
          quantity: quantity);

      http.Response res = await http.post(
        Uri.parse("$myIPAddress/admin/add-product"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: jsonEncode(product),
      );

      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            showSnakBar(context, "Product added succesfully");
            Navigator.pop(context);
          });
    } catch (e) {
      showSnakBar(context, e.toString());
    }
  }
}
