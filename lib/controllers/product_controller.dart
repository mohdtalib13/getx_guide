  import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studio_projects/models/product_model.dart';
import 'package:studio_projects/services/product_service.dart';

class ProductController extends GetxController {
 ProductService productService = Get.find<ProductService>();

  var product = <ProductModel>[].obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    generateRandomColor();
    fetchProducts();
  }

  var randomColor = <Color>[];

  generateRandomColor() {
    // randomColor.add();
    print(randomColor);
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      errorMessage('');
      final products = await productService.fetchProducts();
      product.assignAll(products);
      product.value = products;
    } catch (e) {
      errorMessage('Error fetching products');
    } finally {
      isLoading(false);
    }
  }
}