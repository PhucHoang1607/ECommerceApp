import 'dart:convert';

import 'package:e_commerce_app_project/model/product.dart';
import 'package:e_commerce_app_project/model/user.dart';
import 'package:e_commerce_app_project/services/config.dart';
import 'package:e_commerce_app_project/services/global/auth.dart';
import 'package:http/http.dart' as http;

Future<List<User>> getListUser() async {
  final token = await getAccessToken();
  try {
    final response = await http.get(
      Uri.parse(Config.userGetAdUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode != 200) {
      print(
          'Failed to fetch categories: ${response.statusCode} - ${response.body}');
      return [];
    } else {
      final List<dynamic> users = jsonDecode(response.body);

      return users.map((json) => User.fromJson(json)).toList();
    }
  } catch (e) {
    print('Error fetching categories: $e');
    return [];
  }
}
