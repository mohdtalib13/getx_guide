import 'package:get/get.dart';
import 'package:studio_projects/controllers/cart_controller.dart';
import 'package:studio_projects/controllers/product_controller.dart';

class ProductBinding extends Bindings {

  @override
  void dependencies() {
    Get.put(ProductController());
    // Get.lazyPut<CartController>(() => CartController());
  }
}