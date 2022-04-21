import 'package:flutter/material.dart';

class Product {
  final String id;
  final String title, description;
  final List<String> images;
  final List<Color> colors;
  final double rating, price;
  bool isFavourite, isPopular;

  Product(
      {
      required this.id,
      required this.title,
      required this.description,
      required this.images,
      required this.colors,
      required this.rating,
      required this.price,
      required this.isFavourite,
      required this.isPopular});

  void changeFav () {
    isFavourite = !isFavourite;
  }
}
