import 'dart:io';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/constants/env.dart';
import 'package:shopping_app/constants/utils.dart';
import 'package:shopping_app/models/product.dart';

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

      Product product = Product(category: category, description: description, images: imageUrls, name: name, price: price, quantity: quantity);
    } catch (e) {
      showSnakBar(context, e.toString());
    }
  }
}
