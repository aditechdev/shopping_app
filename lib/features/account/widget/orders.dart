import 'package:flutter/material.dart';
import 'package:shopping_app/constants/global_variable.dart';
import 'package:shopping_app/features/account/widget/single_product.dart';

class Orders extends StatefulWidget {
  Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  List list = [
    'https://images.unsplash.com/photo-1644982648791-a010e61aa845?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60'
    'https://images.unsplash.com/photo-1644982648791-a010e61aa845?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60'
    'https://images.unsplash.com/photo-1644982648791-a010e61aa845?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60'
    'https://images.unsplash.com/photo-1644982648791-a010e61aa845?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60'
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15,
        right: 15,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Your Orders",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              // Your orders
              Text(
                "View all",
                style: TextStyle(
                  fontSize: 14,
                  color: GlobalVariable.selectedNavBarColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Container(
            height: 170,
            padding: const EdgeInsets.only(
              left: 10,
              top: 20,
              right: 0,
            ),
            child: ListView.builder(
              scrollDirection: Axis.vertical,
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return  SingleProduct(
                    images: list[index],
                  );
                }),
          )
        ],
      ),
    );
  }
}
