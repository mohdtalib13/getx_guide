import 'package:get/get.dart';
import 'package:studio_projects/bindings/cart_binding.dart';
import 'package:studio_projects/bindings/product_bindings.dart';
import 'package:studio_projects/views/cart_view.dart';
import 'package:studio_projects/views/checkout_view.dart';
import 'package:studio_projects/views/product_details_view.dart';
import 'package:studio_projects/views/product_view.dart';

part 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.Product,
      page: () => ProductView(),
      binding: ProductBinding(),
    ),
    GetPage(
      name: Routes.Product_Details,
      page: () => ProductDetailsView(),
      binding: CartBinding(),
    ),
    GetPage(name: Routes.Cart, page: () => CartView()),
    GetPage(name: Routes.Checkout, page: () => CheckoutView()),
  ];
}
