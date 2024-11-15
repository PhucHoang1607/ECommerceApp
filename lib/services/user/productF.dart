import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:e_commerce_app_project/model/product.dart';
import 'package:e_commerce_app_project/services/config.dart';
import 'package:e_commerce_app_project/services/global/auth.dart';

Future<List<Product>> get4Product({int page = 1, int pageSize = 10}) async {
  final token = await getAccessToken();
  final productUrl = Uri.parse(Config.getProductNewest);
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

Future<List<Product>> getProductListUser(
    {int page = 1, int pageSize = 10}) async {
  final token = await getAccessToken();
  final productUrl = Uri.parse('${Config.getProductAll}?page=1');
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

Future<List<Product>> fetchProductsByCategory(String categoryId) async {
  final url = Uri.parse(Config.getProductBycategoryId(categoryId));
  final token = await getAccessToken();

  final response = await http.get(url, headers: {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $token',
  });

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    final productsJson = data['products'] ?? [];
    return productsJson.map<Product>((json) => Product.fromJson(json)).toList();
  } else if (response.statusCode == 404) {
    print('Category not found');
    return [];
  } else {
    print("Error fetching category data: ${response.statusCode}");
    throw Exception("Failed to fetch products");
  }
}
