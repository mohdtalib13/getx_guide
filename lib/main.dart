import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:studio_projects/controllers/cart_controller.dart';
import 'package:studio_projects/controllers/product_controller.dart';
import 'package:studio_projects/routes/app_pages.dart';
import 'package:studio_projects/services/cart_service.dart';
import 'package:studio_projects/services/product_service.dart';
import 'package:studio_projects/services/theme_services.dart';
import 'package:studio_projects/services/translations.dart';

void main() async {
  await GetStorage.init();
  Get.put(CartService());
  Get.put(ProductService());
  Get.put(CartController());
  Get.put(ProductController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Product App',
      getPages: AppPages.routes,
      initialRoute: Routes.Product,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeServices().theme,
      translations: AppTranslations(),
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
    );
  }
}
