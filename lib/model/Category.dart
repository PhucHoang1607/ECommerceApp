import 'dart:convert';
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Category {
  final String id;
  final String name;
  final String? imgUrl;

  Category({required this.name, this.imgUrl}) : id = uuid.v4();

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'imgUrl': imgUrl,
    };
  }

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(name: json['name'], imgUrl: json['imgUrl']);
  }
}
