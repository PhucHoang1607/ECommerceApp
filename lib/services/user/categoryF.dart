import 'dart:convert';

import 'package:e_commerce_app_project/model/category.dart';
import 'package:e_commerce_app_project/services/config.dart';
import 'package:e_commerce_app_project/services/global/auth.dart';
import 'package:http/http.dart' as http;

Future<List<Category>> getListCategoryUser() async {
  final token = await getAccessToken();
  try {
    final response = await http.get(
      Uri.parse(Config.getCategoryUser),
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

Future<List<Category>> getCategoryById(String id) async {
  final token = await getAccessToken();
  try {
    final response = await http.get(
      Uri.parse(Config.getCategoryIdUser(id)),
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
