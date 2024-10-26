import 'package:e_commerce_app_project/model/Category.dart';
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

class Product {
  final String id;
  final String name;
  final Category category;
  final Size size;
  final double price;
  final String style;
  final String imageURL;
  final bool isLike;
  final String description;
  final DateTime dateTimeCreate = DateTime.now();

  Product(
      {required this.name,
      required this.price,
      required this.category,
      required this.size,
      required this.imageURL,
      required this.isLike,
      required this.style,
      required this.description})
      : id = uuid.v4();
}

var ampersendSize = {
  Size.small: "S",
  Size.medium: "M",
  Size.large: "L",
  Size.extraLarge: "XL",
  Size.doubleExtraLarge: "XXL",
  Size.tripleExtraLarge: "XXXL",
};

// var categoryIcon = {
//   Category.tshirt: {
//     Image.asset("asset/icon/shirt.png"),
//   },
//   Category.trousers: {
//     Image.asset("asset/icon/jeans.png"),
//   },
//   Category.dress: {
//     Image.asset("asset/icon/dress.png"),
//   },
//   Category.jacket: {
//     Image.asset("asset/icon/jacket.png"),
//   },
//   Category.accessory: {
//     Image.asset("asset/icon/sunglasses.png"),
//   },
//   Category.vest: {
//     Image.asset("asset/icon/suit.png"),
//   }
// };
