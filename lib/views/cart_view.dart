import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studio_projects/controllers/cart_controller.dart';
import 'package:studio_projects/routes/app_pages.dart';

class CartView extends StatelessWidget {
  CartView({super.key});

  final CartController cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    final emptyContent = Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'nothing to show!'.tr,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          ),
          // const SizedBox(height: 10),
          TextButton(
            onPressed: () {
              Get.offAllNamed(Routes.Product);
            },
            child: Text(
              "let's add something".tr,
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
          ),
        ],
      ),
    );
    return Scaffold(
      appBar: AppBar(title: Text('cart'.tr), centerTitle: true, actions: [
        IconButton(
          onPressed: () {
            Get.defaultDialog(
              title: 'clear cart'.tr,
              middleText: 'are you sure you want to clear the cart?'.tr,
              textConfirm: 'yes'.tr, 
              textCancel: 'no'.tr,
              onCancel: () {},
              onConfirm: () {
                cartController.removeAllFromCart();
                Get.back();
              }
            );
          },
          icon: Icon(
          Icons.delete_forever_outlined,
          ),
          tooltip: 'clear cart'.tr,),
      ],),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              if(cartController.cartItems.isEmpty) {
                return emptyContent;
              }
              return ListView.builder(
                itemCount: cartController.cartItems.length,
                itemBuilder: (context, index) {
                  final product = cartController.cartItems[index];
                  return ListTile(
                    leading: Container(
                      height: 30,
                      width: 30,
                      color: product.color,
                    ),
                    title: Text(product.title),
                    subtitle: Text('\$${product.price}'),
                    trailing: IconButton(
                      onPressed: () {
                        Get.defaultDialog(
                          buttonColor: Colors.deepPurple,
                          title: 'remove product?'.tr,
                          middleText:
                              'are you sure you want to remove ${product.title} from cart?'.tr,
                          textConfirm: 'yes'.tr,
                          textCancel: 'no'.tr,
                          onConfirm: () {
                            cartController.removeFromCart(product);
                            Get.back();
                          },
                          onCancel: () {},
                        );
                      },
                      icon: Icon(
                        Icons.delete_outline_rounded,
                        color: Colors.red,
                      ),
                    ),
                  );
                },
              );
            }),
          ),
          Obx(() {
            return BottomAppBar(
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Items: ${cartController.cartService.totalItems}'.tr,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      Text(
                        'Total: \$${cartController.totalAmount.toStringAsFixed(2)}'.tr,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.toNamed(Routes.Checkout);
                    },
                    child: Text('proceed to checkout'.tr),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
