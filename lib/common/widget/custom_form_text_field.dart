import 'package:flutter/material.dart';
import 'package:shopping_app/constants/global_variable.dart';

class CustomFormTextField extends StatelessWidget {
  final TextEditingController  controller;
  final String label;
  const CustomFormTextField({Key? key, required this.controller, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
      controller: controller,
      decoration:  InputDecoration(
        label: Text(label),
        border:
            const OutlineInputBorder(borderSide: BorderSide(color: Colors.black38)),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: GlobalVariable.secondaryColor)),
      ),
      validator: (value) {
        // Todo
      },
    );
  }
}
