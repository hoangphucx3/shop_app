import 'package:flutter/material.dart';
import 'package:shop_app/models/product.dart';
import 'package:uuid/uuid.dart';

var uuid = Uuid();
List<Product> demoProducts = [
  Product(
      id: uuid.v4(),
      images: [
        'assets/images/bag_1.jpg',
        'assets/images/bag_2.jpg',
        'assets/images/bag_3.jpg',
        'assets/images/bag_4.jpg',
      ],
      colors: [
        Color(0xFFF6625E),
        Color(0xFF836DB8),
        Color(0xFFDECB9C),
        Colors.white,
      ],
      title: 'Super Super Nice Bag',
      description:
          'Super Super Nice Bag Super Super Nice Bag Super Super Nice Bag Super Super Nice Bag',
      rating: 3.5,
      price: 99.9,
      isFavourite: true,
      isPopular: true),
  Product(
      id: uuid.v4(),
      images: [
        'assets/images/phone_1.jpg',
        'assets/images/phone_2.jpg',
        'assets/images/phone_3.jpg',
        'assets/images/phone_4.jpg',
      ],
      colors: [
        Color(0xFFF6625E),
        Color(0xFF836DB8),
        Color(0xFFDECB9C),
        Colors.white,
      ],
      title: 'Super Smart Intelligent Phone',
      description:
          'Super Super Smart Phone Super Super Smart Phone Super Super Smart Phone Super Super Smart Phone Super Super Smart Phone',
      rating: 4.5,
      price: 999.9,
      isFavourite: false,
      isPopular: true),
  Product(
      id: uuid.v4(),
      images: [
        'assets/images/shoes_1.jpg',
        'assets/images/shoes_2.jpg',
        'assets/images/shoes_3.jpg',
        'assets/images/shoes_4.jpg',
      ],
      colors: [
        Color(0xFFF6625E),
        Color(0xFF836DB8),
        Color(0xFFDECB9C),
        Colors.white,
      ],
      title: 'Super Super Colors Shoes',
      description:
          'Super Super Colors Shoes Super Super Colors Shoes Super Super Colors Shoes Super Super Colors Shoes Super Super Colors Shoes',
      rating: 2.5,
      price: 59.9,
      isFavourite: true,
      isPopular: false),
  Product(
      id: uuid.v4(),
      images: [
        'assets/images/watch_1.jpg',
        'assets/images/watch_2.jpg',
        'assets/images/watch_3.jpg',
        'assets/images/watch_4.jpg',
      ],
      colors: [
        Color(0xFFF6625E),
        Color(0xFF836DB8),
        Color(0xFFDECB9C),
        Colors.white,
      ],
      title: 'Super Super Expensive Watch',
      description:
          'Super Super Expensive Watch Super Super Expensive Watch Super Super Expensive Watch Super Super Expensive Watch',
      rating: 4.8,
      price: 9999.9,
      isFavourite: false,
      isPopular: false),
  Product(
      id: uuid.v4(),
      images: [
        'assets/images/watch_4.jpg',
        'assets/images/watch_1.jpg',
        'assets/images/watch_2.jpg',
        'assets/images/watch_3.jpg',
      ],
      colors: [
        Color(0xFFF6625E),
        Color(0xFF836DB8),
        Color(0xFFDECB9C),
        Colors.white,
      ],
      title: 'Super Super Expensive Watch',
      description:
          'Super Super Expensive Watch Super Super Expensive Watch Super Super Expensive Watch Super Super Expensive Watch',
      rating: 4.8,
      price: 9999.9,
      isFavourite: false,
      isPopular: false),
  Product(
      id: uuid.v4(),
      images: [
        'assets/images/watch_3.jpg',
        'assets/images/watch_1.jpg',
        'assets/images/watch_2.jpg',
        'assets/images/watch_4.jpg',
      ],
      colors: [
        Color(0xFFF6625E),
        Color(0xFF836DB8),
        Color(0xFFDECB9C),
        Colors.white,
      ],
      title: 'Super Super Expensive Watch',
      description:
          'Super Super Expensive Watch Super Super Expensive Watch Super Super Expensive Watch Super Super Expensive Watch',
      rating: 4.8,
      price: 9999.9,
      isFavourite: false,
      isPopular: false),
];
