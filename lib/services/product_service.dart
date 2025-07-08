import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:studio_projects/models/product_model.dart';

class ProductService extends GetxService {
  final String apiUrl = 'https://fakestoreapi.com/products';

  Future<List<ProductModel>> fetchProducts() async {
    final response = await http.get(Uri.parse(apiUrl));
    // print("Response: ${response.body}");

    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      // print("Data: $data");
      var products = data.map((productJson) => ProductModel.fromJson(productJson)).toList();
      // print("Products: $products");
      return products;
    } else {
      throw Exception('Failed to load products');
    }
  }
}