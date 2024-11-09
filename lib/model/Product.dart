import 'package:e_commerce_app_project/model/category.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

//enum Category { tshirt, dress, trousers, jacket, accessory, vest }

enum Size {
  small,
  medium,
  large,
  extraLarge,
  doubleExtraLarge,
  tripleExtraLarge
}

enum GenderAgeCategory {
  men,
  women,
  kids,
  modern,
  arrive,
}

class Product {
  final String id;
  final String name;
  final String description;
  final int price;
  final List<String>? color;
  final String image;
  final List<String>? imageDetail;
  final List<String>? sizes;
  final String category;
  final GenderAgeCategory? genderAgecategory;
  final DateTime? dateAdded;
  final int countInStock;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    this.color,
    required this.image,
    this.imageDetail,
    this.sizes,
    required this.category,
    this.genderAgecategory,
    required this.dateAdded,
    required this.countInStock,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['_id'],
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      price: json['price'] ?? 0,
      color: List<String>.from(json['color'] ?? []),
      image: json['image'] ?? '',
      imageDetail: List<String>.from(json['imageDetail'] ?? []),
      sizes: List<String>.from(json['sizes'] ?? []),
      category: json['category'] ?? '',

      // category: json['category'],
      genderAgecategory:
          _stringToGenderAgeCategory(json['genderAgecategory'] ?? 'men'),
      dateAdded: json['dateAdded'] != null && json['dateAdded'] is String
          ? DateTime.tryParse(json['dateAdded']) ??
              DateTime.now() // Nếu không thể chuyển đổi, dùng ngày hiện tại
          : null,
      countInStock: json['countInStock'] ?? 1,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'description': description,
      'price': price,
      'color': color,
      'image': image,
      'imageDetail': imageDetail,
      'sizes': sizes,
      'category': category,
      'genderAgecategory': _genderAgeCategoryToString(genderAgecategory!),
      'dateAdded': dateAdded,
      'countInStock': countInStock,
    };
  }

  // Helper method to convert string to enum
  static GenderAgeCategory _stringToGenderAgeCategory(String value) {
    return GenderAgeCategory.values
        .firstWhere((e) => e.toString().split('.').last == value);
  }

  // Helper method to convert enum to string
  static String _genderAgeCategoryToString(GenderAgeCategory category) {
    return category.toString().split('.').last;
  }
}
