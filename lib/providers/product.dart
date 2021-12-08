import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFav;

  Product(
      {required this.id,
      required this.description,
      this.isFav = false,
      required this.price,
      required this.title,
      required this.imageUrl});

  void toggleFav() {
    isFav = !isFav;
    notifyListeners();
  }
}
