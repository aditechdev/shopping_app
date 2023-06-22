import 'package:flutter/material.dart';
import 'package:shopping_app/features/admin/screen/add_product_screen.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  navigateToAddProduct() {
     Navigator.pushNamed(context, AddProductScreen.routeName);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text("Products"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => navigateToAddProduct(),
        tooltip: "Add a product",
        child: const Icon(
          Icons.add,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
