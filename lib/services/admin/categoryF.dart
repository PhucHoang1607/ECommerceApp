import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:e_commerce_app_project/model/category.dart';
import 'package:e_commerce_app_project/services/config.dart';
import 'package:e_commerce_app_project/services/global/auth.dart';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

Future<List<Category>> getListCategory() async {
  final token = await getAccessToken();
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

// Future<void> addCategory({
//   required Category category,
//   File? imageFile,
// }) async {
//   final token = await getAccessToken();

//   final url = Uri.parse(Config.categoryAddAdUrl);
//   final request = http.MultipartRequest('POST', url);
//   print(url);
//   request.headers.addAll({
//     'Content-Type': 'application/json',
//     'Authorization': 'Bearer $token',
//   });

//   if (category.image.startsWith('http')) {
//     request.fields['image'] = category.image;
//   } else if (imageFile != null) {
//     request.files.add(
//       await http.MultipartFile.fromPath(
//         'image',
//         imageFile.path,
//       ),
//     );
//   }

//   request.fields['name'] = category.name;

//   try {
//     final response = await request.send();

//     if (response.statusCode != 200) {
//       //print('Failed to add category. Status code: ${response.statusCode}');
//     } else {
//       final responseData = await response.stream.bytesToString();
//       final data = jsonDecode(responseData);
//       print('Category added successfully: $data');
//     }
//   } catch (e) {
//     print('Error fetching categories: $e');
//   }
// }

Future<void> addCategory({
  required Category category,
  File? imageFile,
  String? imageUrl,
}) async {
  final token = await getAccessToken();

  final url = Uri.parse(Config.categoryAddAdUrl);
  final request = http.MultipartRequest('POST', url);
  print(url);
  request.headers.addAll({
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $token',
  });

  // Kiểm tra nếu là URL ảnh
  if (imageUrl != null && category.image.startsWith('http')) {
    // Nếu là URL ảnh, thêm vào body

    request.fields['image'] = category.image;
  } else if (imageFile != null) {
    // Nếu là file ảnh, thêm file vào Multipart request
    request.files.add(
      await http.MultipartFile.fromPath(
        'image',
        imageFile.path,
        contentType: MediaType('image', 'jpeg'),
      ),
    );
  }

  // Thêm tên category vào body
  request.fields['name'] = category.name;

  try {
    final response = await request.send();

    // Kiểm tra mã trạng thái HTTP
    if (response.statusCode != 200) {
      print('Failed to add category. Status code: ${response.statusCode}');
    } else {
      final responseData = await response.stream.bytesToString();
      final data = jsonDecode(responseData);
      print('Category added successfully: $data');
    }
  } catch (e) {
    print('Error fetching categories: $e');
  }
}
