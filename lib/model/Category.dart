import 'dart:convert';
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Category {
  final String id;
  final String name;
  final String? imgUrl;
  final bool? markedForDeletion;

  Category({
    required this.id,
    required this.name,
    this.imgUrl,
    this.markedForDeletion = false,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['_id'],
      name: json['name'],
      imgUrl: json['imgUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'imgUrl': imgUrl,
      'markedForDeletion': markedForDeletion
    };
  }
}
