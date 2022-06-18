import 'package:flutter/material.dart';
import 'package:shopping_app/constants/global_variable.dart';

class AddProductScreen extends StatefulWidget {
  static const String routeName = "/add-product";
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBar(
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                  gradient: GlobalVariable.appBarGradient,
                ),
              ),
              title: const Text(
                "Add Product",
                style: TextStyle(
                  color: Colors.black,
                ),
              )),
        ),
        body: const Text("Add Product"));
  }
}
