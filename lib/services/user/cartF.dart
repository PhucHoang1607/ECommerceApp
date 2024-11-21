import 'dart:convert';

import 'package:e_commerce_app_project/model/cart_product.dart';
import 'package:e_commerce_app_project/services/config.dart';
import 'package:e_commerce_app_project/services/global/auth.dart';
import 'package:http/http.dart' as http;

Future<List<CartProduct>> getUserCart() async {
  final token = await getAccessToken();
  final userId = await getUserId();
  final url = Uri.parse(Config.getUserCart('$userId'));
  final response = await http.get(
    url,
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    },
  );

  if (response.statusCode != 200) {
    print('API: ${response.body}');
    print('Failed to fetch categories: ${response.statusCode}');
    return [];
  } else {
    print('API:  ${response.body}');
    final List<dynamic> jsonDecodeData = jsonDecode(response.body);
    return jsonDecodeData.map((item) => CartProduct.fromJson(item)).toList();
  }
}

Future<void> addToCart({
  required String productId,
  required int quantity,
  required String selectedSize,
  required String selectedColor,
}) async {
  final userId = await getUserId();
  final token = await getAccessToken();
  final url = Uri.parse(Config.addToCart('$userId'));
  final response = await http.post(
    url,
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    },
    body: jsonEncode({
      'productId': productId,
      'quantity': 1,
      'selectedSize': selectedSize,
      'selectedColor': selectedColor,
    }),
  );

  if (response.statusCode == 201) {
    print('Product Added to cart sucessfully');
  } else {
    throw Exception('Fail to Added to Cart: ${response.statusCode}');
  }
}
