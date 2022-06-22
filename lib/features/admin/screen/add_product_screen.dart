import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/common/widget/custom_button.dart';
import 'package:shopping_app/common/widget/custom_form_text_field.dart';
import 'package:shopping_app/constants/global_variable.dart';
import 'package:shopping_app/constants/utils.dart';
import 'package:shopping_app/features/admin/services/admin_services.dart';

class AddProductScreen extends StatefulWidget {
  static const String routeName = "/add-product";
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final AdminServices adminServices = AdminServices();
  Color enableBorderColor = Colors.black38;
  String category = "Mobiles";
  List<String> productCategory = [
    'Mobiles',
    'Essentials',
    'Appliances',
    'Books',
    'Fashion'
  ];
  List<File> images = [];
  final _addProductFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    productNameController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    quantityController.dispose();
    super.dispose();
  }

  void pickFilessdsssd() async {
    var res = await pickImages();
    setState(() {
      images = res;
    });
  }

  void sellProduct() {
    if (_addProductFormKey.currentState!.validate() && images.isNotEmpty ) {
      adminServices.sellProduct(
        context: context,
        name: productNameController.text,
        description: descriptionController.text,
        price: double.parse(priceController.text),
        quantity: double.parse(quantityController.text),
        category: category,
        images: images,
      );
    }
  }

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
      body: SingleChildScrollView(
        child: Form(
          key: _addProductFormKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                //! Select Product Image
                images.isNotEmpty
                    ? CarouselSlider(
                        items: images.map((e) {
                          return Builder(
                              builder: (BuildContext context) => Image.file(
                                    e,
                                    fit: BoxFit.cover,
                                    height: 200,
                                    width: double.infinity,
                                  ));
                        }).toList(),
                        options: CarouselOptions(
                          viewportFraction: 1,
                          height: 200,
                        ),
                      )
                    : GestureDetector(
                        onTap: pickFilessdsssd,
                        child: DottedBorder(
                          borderType: BorderType.RRect,
                          radius: const Radius.circular(10),
                          dashPattern: const [10, 4],
                          strokeCap: StrokeCap.round,
                          child: Container(
                            width: double.infinity,
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.folder_open,
                                  size: 40,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  "Select Product Images",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey[400]),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                const SizedBox(
                  height: 30,
                ),

                //! Form Field: Product Name
                CustomFormTextField(
                  controller: productNameController,
                  label: 'Product Name',
                  enabledBordercolor: enableBorderColor,
                ),
                const SizedBox(
                  height: 10,
                ),
                //! FormField: Description
                CustomFormTextField(
                  controller: descriptionController,
                  label: 'Description',
                  maxLines: 4,
                  enabledBordercolor: enableBorderColor,
                ),
                const SizedBox(
                  height: 10,
                ),
                //! FormField: Price
                CustomFormTextField(
                  controller: priceController,
                  label: 'Price',
                  enabledBordercolor: enableBorderColor,
                ),
                const SizedBox(
                  height: 10,
                ),
                //! Quantity
                CustomFormTextField(
                  controller: quantityController,
                  label: 'Quantity',
                  enabledBordercolor: enableBorderColor,
                ),
                const SizedBox(
                  height: 10,
                ),
                //! FormField: DropDown Menu Category
                SizedBox(
                  width: double.infinity,
                  child: DropdownButton(
                    value: category,
                    icon: const Icon(Icons.arrow_drop_down),
                    items: productCategory.map((e) {
                      return DropdownMenuItem(value: e, child: Text(e));
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        category = value!;
                      });
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
      //! Submit button
      bottomNavigationBar:
          CustomButton(buttonText: "Submit".toUpperCase(), onTap: sellProduct),
    );
  }
}
