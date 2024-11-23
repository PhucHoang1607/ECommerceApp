import 'dart:convert';

import 'package:e_commerce_app_project/model/cart_product.dart';
import 'package:e_commerce_app_project/services/config.dart';
import 'package:e_commerce_app_project/services/global/auth.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

Future<void> checkoutCod(List<CartProduct> cartProduct, String shippingAddress,
    String city, String postalCode, String country, String phone) async {
  final url = Uri.parse(Config.checkoutCOD);
  final token = await getAccessToken();
  final userId = await getUserId();

  final List<Map<String, dynamic>> cartItemList =
      cartProduct.map((item) => item.toJson()).toList();

  final response = await http.post(
    url,
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    },
    body: jsonEncode({
      "userId": userId,
      'cartItem': cartItemList,
      'shippingAddress': shippingAddress,
      'city': city,
      'postalCode': postalCode,
      'country': country,
      'phone': phone,
    }),
  );

  if (response.statusCode == 201) {
    final responseData = jsonDecode(response.body);
    print('Order Created: ${responseData['order']}');
  } else {
    print("error: ${response.body}");
  }
}
