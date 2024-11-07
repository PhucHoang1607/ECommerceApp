import 'dart:convert';

import 'package:e_commerce_app_project/model/product.dart';
import 'package:e_commerce_app_project/services/config.dart';
import 'package:e_commerce_app_project/services/global/auth.dart';
import 'package:http/http.dart' as http;

Future<List<Product>> getProductList(String token) async {
  //final token = getAccessToken();
  final productUrl = Uri.parse(Config.productGetAdUrl);
  try {
    final response = await http.get(
      productUrl,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode != 200) {
      print('Failed to fetch products: ${response.statusCode}');
      return [];
    } else {
      final List<dynamic> products = jsonDecode(response.body);
      return products.map((json) => Product.fromJson(json)).toList();
    }
  } catch (e) {
    print('Error fetching products: $e');
    return [];
  }
}
