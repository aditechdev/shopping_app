import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/constants/global_variable.dart';

class CaroselImage extends StatelessWidget {
  const CaroselImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: GlobalVariable.carouselImages.map((e) {
        return Builder(
            builder: (BuildContext context) => Image.asset(
                  e,
                  fit: BoxFit.cover,
                  height: 200,
                  width: double.infinity,
                ));
      }).toList(),
      options: CarouselOptions(
        viewportFraction: 1,
        height: 200,
        autoPlay: true,
      ),
    );
  }
}
