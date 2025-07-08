import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studio_projects/controllers/product_controller.dart';
import 'package:studio_projects/routes/app_pages.dart';
import 'package:studio_projects/services/theme_services.dart';

class ProductView extends StatelessWidget {
  ProductView({super.key});

  final ProductController productController = Get.find<ProductController>();

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade400,
        title: Text('product list'.tr),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              if (Get.locale == Locale('en', 'US')) {
                Get.updateLocale(Locale('es', 'ES'));
              } else {
                Get.updateLocale(Locale('en', 'US'));
              }
            },
            icon: Icon(Icons.language),
            tooltip: 'Change Language',
          ),
          IconButton(
            onPressed: () {
              ThemeServices().switchTheme();
            },
            icon: Icon(Icons.brightness_4),
            tooltip: 'Change Theme',
          ),
        ],
      ),
      body: Obx(() {
        if (productController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (productController.errorMessage.isNotEmpty) {
          return Center(child: Text(productController.errorMessage.value));
        }

        return ListView.builder(
          itemCount: productController.product.length,
          itemBuilder: (context, index) {
            final product = productController.product[index];
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                // color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    // blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: ListTile(
                leading: Container(
                  height: 30,
                  width: 30,
                  color: Color(
                    (Random().nextDouble() * 0xFFFFFF).toInt(),
                  ).withAlpha(255),
                ),
                title: Text(
                  product.title,
                  style: TextStyle(overflow: TextOverflow.ellipsis),
                ),
                subtitle: Text('\$${product.price}'),
                onTap: () {
                  if (product == null) {
                    Get.snackbar('Error', 'Product not found');
                  } else {
                    Get.toNamed(Routes.Product_Details, arguments: product);
                  }
                },
              ),
            );
          },
        );
      }),
    );
  }
}
