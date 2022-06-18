import 'package:flutter/material.dart';

class AddProductScreen extends StatefulWidget {
  static const String routeName = "AddProductScreen";
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Text("Add Product"),
    ));
  }
}
