import 'package:flutter/material.dart';
import 'package:shopping_app/constants/global_variable.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: GlobalVariable.appBarGradient,
            ),
          ),
        ),
      ),
    );
  }
}