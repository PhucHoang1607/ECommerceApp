import 'dart:convert';
import 'dart:io';

import 'package:e_commerce_app_project/model/product.dart';
import 'package:e_commerce_app_project/services/config.dart';
import 'package:e_commerce_app_project/services/global/auth.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<List<Product>> getProductList({int page = 1, int pageSize = 10}) async {
  final token = await getAccessToken();
  final productUrl = Uri.parse('${Config.productGetAdUrl}?page=1');
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

// Future<void> addProduct({
//   required String name,
//   required String description,
//   required int price,
//   required List<String> color,
//   required List<String> sizes,
//   required String category,
//   required String genderAgecategory,
//   DateTime? dateAdded,
//   required int countInStock,
//   String? imageUrl,
//   File? imageFile,
//   List<String>? imageUrls,
//   List<File>? imageDetails,
// }) async {
//   final uri = Uri.parse(Config.productAddAdUrl);
//   final request = http.MultipartRequest('POST', uri);
//   final token = await getAccessToken();

//   request.headers['Authorization'] = 'Bearer $token';

//   // Adding text fields
//   request.fields['name'] = name;
//   request.fields['description'] = description;
//   request.fields['price'] = price.toString();
//   request.fields['genderAgecategory'] = genderAgecategory;
//   request.fields['countInStock'] = countInStock.toString();
//   request.fields['dateAdded'] = DateTime.now().toIso8601String();

//   // Add color list
//   for (int i = 0; i < color.length; i++) {
//     request.fields['color[$i]'] = color[i];
//   }

//   // Add sizes list
//   for (int i = 0; i < sizes.length; i++) {
//     request.fields['sizes[$i]'] = sizes[i];
//   }

//   request.fields['category'] = category;

//   // Handle main image as either a URL or a file
//   if (imageUrl != null && imageFile == null) {
//     request.fields['image'] = imageUrl;
//   } else if (imageFile != null) {
//     request.files
//         .add(await http.MultipartFile.fromPath('image', imageFile.path));
//   }

//   // Handle multiple image URLs if provided
//   if (imageUrls != null && imageUrls.isNotEmpty) {
//     for (int i = 0; i < imageUrls.length; i++) {
//       request.fields['imageDetail[$i]'] = imageUrls[i];
//     }
//   }

//   // Handle multiple image files if provided
//   if (imageDetails != null && imageDetails.isNotEmpty) {
//     for (var i = 0; i < imageDetails.length; i++) {
//       request.files.add(await http.MultipartFile.fromPath(
//         'imageDetail[$i]',
//         imageDetails[i].path,
//       ));
//     }
//   }

//   try {
//     final response = await request.send();
//     final res = await http.Response.fromStream(response);

//     if (res.statusCode == 201) {
//       print("Product added successfully");
//     } else {
//       print("Failed to add product: ${res.statusCode}");
//       print("Response: ${res.body}");
//     }
//   } catch (e) {
//     print("Error: $e");
//   }
// }

Future<void> addProduct({
  required String name,
  required String description,
  required int price,
  required List<String> color,
  required List<String> sizes,
  required String category,
  required String genderAgecategory,
  DateTime? dateAdded,
  required int countInStock,
  String? imageUrl,
  File? imageFile,
  List<String>? imageUrls,
  List<File>? imageDetails,
}) async {
  final uri = Uri.parse(Config.productAddAdUrl);
  final request = http.MultipartRequest('POST', uri);
  final token = await getAccessToken();

  request.headers['Authorization'] = 'Bearer $token';

  // Adding text fields
  request.fields['name'] = name;
  request.fields['description'] = description;
  request.fields['price'] = price.toString();
  request.fields['genderAgecategory'] = genderAgecategory;
  request.fields['countInStock'] = countInStock.toString();
  request.fields['dateAdded'] = DateTime.now().toIso8601String();

  for (int i = 0; i < color.length; i++) {
    request.fields['color[$i]'] = color[i];
  }

  for (int i = 0; i < sizes.length; i++) {
    request.fields['sizes[$i]'] = sizes[i];
  }

  request.fields['category'] = category;

  // Handle main image as either a URL or a file
  if (imageUrl != null && imageFile == null) {
    request.fields['image'] = imageUrl;
  } else if (imageFile != null) {
    request.files
        .add(await http.MultipartFile.fromPath('image', imageFile.path));
  }

  // // Handle multiple image URLs if provided
  // if (imageUrls != null) {
  //   for (int i = 0; i < imageUrls.length; i++) {
  //     request.fields['imageDetailUrl_$i'] = imageUrls[i];
  //   }
  // }

  // // Handle multiple image files if provided
  // if (imageDetails != null) {
  //   for (var i = 0; i < imageDetails.length; i++) {
  //     request.files.add(await http.MultipartFile.fromPath(
  //         'imageDetail', imageDetails[i].path));
  //   }
  // }
  if (imageUrls != null && imageUrls.isNotEmpty) {
    for (var i = 0; i < imageUrls.length; i++) {
      request.fields['imageDetail[$i]'] = imageUrls[i];
    }
  }

  if (imageDetails != null && imageDetails.isNotEmpty) {
    for (var i = 0; i < imageDetails.length; i++) {
      request.files.add(await http.MultipartFile.fromPath(
        'imageDetail[$i]',
        imageDetails[i].path,
      ));
    }
  }

  try {
    final response = await request.send();
    final res = await http.Response.fromStream(response);

    if (res.statusCode == 201) {
      print("Product added successfully");
    } else {
      print("Failed to add product: ${res.statusCode}");
      print("Response: ${res.body}");
    }
  } catch (e) {
    print("Error: $e");
  }
}

// Future<Product> editProduct() async {
//   try {} catch (e) {
//     print('Error creating products: $e');
//   }
// }

Future<void> deleteProduct(String productId) async {
  final token = await getAccessToken();
  final url = Uri.parse(Config.productDeleteAdUrl(productId));
  try {
    final response = await http.delete(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 404) {
      throw Exception('Product not found');
    } else if (response.statusCode != 204) {
      throw Exception('Failed to delete categpory');
    } else {
      print('Delete Successfully');
    }
  } catch (e) {
    print('Error delete products: $e');
  }
}
