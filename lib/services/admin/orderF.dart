import 'dart:convert';

import 'package:e_commerce_app_project/model/order.dart';
import 'package:e_commerce_app_project/services/config.dart';
import 'package:e_commerce_app_project/services/global/auth.dart';
import 'package:http/http.dart' as http;

Future<List<Order>> getListOrder() async {
  final token = await getAccessToken();
  final orderUrl = Uri.parse(Config.ordersGetAdUrl);
  //try {
  final response = await http.get(
    orderUrl,
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    },
  );

  if (response.statusCode != 200) {
    print('Failed to fetch order: ${response.statusCode}');
    return [];
  } else {
    final List<dynamic> orders = jsonDecode(response.body);
    return orders.map((json) => Order.fromJson(json)).toList();
  }
  // } catch (e) {
  //   print('Error fetching order: $e');
  //   return [];
  //}
}
