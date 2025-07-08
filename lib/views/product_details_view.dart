import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studio_projects/controllers/cart_controller.dart';
import 'package:studio_projects/controllers/product_controller.dart';
import 'package:studio_projects/models/product_model.dart';
import 'package:studio_projects/routes/app_pages.dart';

class ProductDetailsView extends StatelessWidget {
  ProductDetailsView({super.key});

  final CartController cartController = Get.find<CartController>();
  final ProductController productController = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    final ProductModel product = Get.arguments;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text('product details'.tr),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(Routes.Cart);
            },
            icon: const Icon(Icons.shopping_cart_outlined),
            tooltip: 'view cart'.tr,
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Card(
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                            color: product.color,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Icon(Icons.image, size: 60, color: Colors.white.withAlpha(128)),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          product.title,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          '\$${product.price}',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey[700],
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 18),
                        // You can add more product details here
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        backgroundColor: Colors.black87,
                      ),
                      onPressed: () {
                        Get.closeCurrentSnackbar();
                        cartController.addToCart(product);
                        Get.snackbar(
                          'added to cart'.tr,
                          '${product.title} added to cart'.tr,
                          duration: const Duration(seconds: 1),
                          isDismissible: true,
                        );
                      },
                      icon: const Icon(Icons.add_shopping_cart_rounded, color: Colors.white),
                      label: Text('add to cart'.tr, style: TextStyle(color: Colors.white, fontSize: 16)),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        backgroundColor: Colors.white,
                        side: const BorderSide(color: Colors.black12),
                        elevation: 0,
                      ),
                      onPressed: () {
                        Get.bottomSheet(
                          Container(
                            color: Colors.white,
                            child: Wrap(
                              children: [
                                ListTile(
                                  leading: const Icon(Icons.shopping_cart_outlined),
                                  title: Text('view cart'.tr),
                                  onTap: () {
                                    Get.toNamed(Routes.Cart);
                                  },
                                ),
                                ListTile(
                                  leading: const Icon(Icons.payment_rounded),
                                  title: Text('proceed to checkout'.tr),
                                  onTap: () {
                                    Get.toNamed(Routes.Checkout);
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      icon: const Icon(Icons.more_horiz, color: Colors.black87),
                      label: Text('more actions'.tr, style: TextStyle(color: Colors.black87, fontSize: 16)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
