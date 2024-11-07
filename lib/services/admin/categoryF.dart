import 'dart:convert';
import 'dart:io';
import 'package:e_commerce_app_project/model/category.dart';
import 'package:e_commerce_app_project/services/config.dart';
import 'package:e_commerce_app_project/services/global/auth.dart';

import 'package:http/http.dart' as http;

Future<List<Category>> getListCategory(String token) async {
  //final token = await getAccessToken();
  try {
    final response = await http.get(
      Uri.parse(Config.categoryGetAdUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode != 200) {
      print('Failed to fetch categories: ${response.statusCode}');
      return [];
    } else {
      final List<dynamic> categories = jsonDecode(response.body);
      return categories.map((json) => Category.fromJson(json)).toList();
    }
  } catch (e) {
    print('Error fetching categories: $e');
    return [];
  }
}
