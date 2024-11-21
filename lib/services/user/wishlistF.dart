import 'dart:convert';

import 'package:e_commerce_app_project/model/wish_list_item.dart';
import 'package:e_commerce_app_project/services/config.dart';
import 'package:e_commerce_app_project/services/global/auth.dart';
import 'package:http/http.dart' as http;

Future<List<WishListItems>> getUserWishList() async {
  final id = await getUserId();
  final url = Uri.parse(Config.getWishListUser('$id'));
  final token = await getAccessToken();
  final response = await http.get(url, headers: {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $token',
  });

  if (response.statusCode == 200) {
    print('API response: ${response.body}');
    // final List<dynamic> jsonResponse = jsonDecode(response.body);
    // return jsonResponse.map((item) => WishListItems.fromJson(item)).toList();

    final List<dynamic> jsonResponse = jsonDecode(response.body);

    return jsonResponse.map((item) => WishListItems.fromJson(item)).toList();
  } else {
    throw Exception('Failed to load wishlist');
  }
}

Future<void> addToWishList(String productId) async {
  final userId = await getUserId();
  final url = Uri.parse(Config.addToWishListUser("$userId"));
  final token = await getAccessToken();
  final response = await http.post(
    url,
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    },
    body: jsonEncode({'productId': productId}),
  );

  if (response.statusCode != 200) {
    throw Exception('Failed to add to WishList');
  }
}

Future<void> removeFromWishList(String productId) async {
  final userId = await getUserId();
  final url = Uri.parse(Config.removeFromWishListUser('$userId', '$productId'));
  final token = await getAccessToken();
  final response = await http.delete(
    url,
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    },
  );
  if (response.statusCode != 204) {
    throw Exception('Failed to remove from wishList');
  } else {
    throw Exception('Remove complete');
  }
}
