import 'package:flutter/cupertino.dart';

class Clothingsamples {
  final String img;
  final String name;
  final String title;
  final double price;
  bool isselected;
  final Color color;

  Clothingsamples(
      {required this.img,
      required this.name,
      required this.title,
      required this.price,
      required this.isselected,
      required this.color, required int height, required int width});
}
