import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studio_projects/controllers/cart_controller.dart';
import 'package:studio_projects/routes/app_pages.dart';

import '../controllers/cart_controller.dart';

class CheckoutView extends StatelessWidget {
  CheckoutView({super.key});

  final CartController cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('checkout'.tr), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('thanks for your purchase'.tr),
            TextButton(
              onPressed: () {
                cartController.cartService.clearCart();
                Get.snackbar(
                  'order completed'.tr,
                  'your order has been successfully placed!'.tr ,
                  duration: Duration(seconds: 1),
                );
                Get.offAllNamed(Routes.Product);
              },
              child: Text('place order'.tr),
            ),
          ],
        ),
      ),
    );
  }
}
