import 'dart:convert';

import 'package:e_commerce_app_project/model/product.dart';
import 'package:e_commerce_app_project/services/config.dart';
import 'package:e_commerce_app_project/services/global/auth.dart';
import 'package:http/http.dart' as http;

Future<List<Product>> getProductList({int page = 1, int pageSize = 10}) async {
  final token = await getAccessToken();
  final productUrl = Uri.parse('${Config.productGetAdUrl}?page=1');
  //try {
  print('token: $token');
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
  // } catch (e) {
  //   print('Error fetching products: $e');
  //   return [];
  // }
}
