import 'dart:convert';
import 'package:e_commerce_app_project/services/config.dart';
import 'package:e_commerce_app_project/services/global/auth.dart';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>?> updateUser({
  required String userId,
  required String name,
  required String phone,
  required String address,
  required String gender,
  required String dateOfBirth,
}) async {
  final url = Uri.parse(
      Config.updateUserUrl(userId)); // Replace with your actual API URL
  final token = await getAccessToken();
  final headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $token',
  };

  // Create the request body
  final body = json.encode({
    'name': name,
    'phone': phone,
    'address': address,
    'gender': gender,
    'dateOfBirth': dateOfBirth,
  });

  try {
    // Send the PUT request
    final response = await http.put(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else if (response.statusCode == 404) {
      return {'error': 'User not found'};
    } else {
      return {'error': 'Failed to update user information'};
    }
  } catch (e) {
    return {'error': 'Connection error: $e'};
  }
}
