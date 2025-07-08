import 'dart:ui';

import 'package:flutter/material.dart';

class ProductModel {
  const ProductModel({
    required this.title,
    required this.price,
    required this.color,
  });

  final String title;
  final double price;
  final Color color;

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    // print("Json: $json");
    return ProductModel(
      title: json['title'] as String,
      price: (json['price'] as num).toDouble(),
      color: Colors.red,
    );
  }

  Map<String, dynamic> toJson() {
    return {'title': title, 'price': price, 'color': color};
  }

  ProductModel copyWith({
    String? title,
    double? price,
    Color? color,
  }) {
    return ProductModel(title: title ?? this.title, price: price ?? this.price, color: color ?? this.color);
  }
}
