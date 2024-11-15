import 'package:e_commerce_app_project/model/Product.dart';

class WishListItems {
  final String id;
  final String productId;
  final String productName;
  final int productPrice;
  final String productImage;
  final bool? productExists;
  final bool? productOutOfStock;

  WishListItems({
    required this.id,
    required this.productId,
    required this.productImage,
    required this.productName,
    required this.productPrice,
    this.productExists,
    this.productOutOfStock,
  });

  factory WishListItems.fromJson(Map<String, dynamic> json) {
    return WishListItems(
      id: json['_id'] ?? '',
      productId: json['productId'] ?? '',
      productImage: json['productImage'] ?? '',
      productName: json['productName'] ?? '',
      productPrice: json['productPrice'] ?? 0,
      productExists: json['productExists'] ?? false,
      productOutOfStock: json['productOutOfStock'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'productId': productId,
      'productImage': productImage,
      'productName': productName,
      'productPrice': productPrice,
      'productExists': productExists,
      'productOutOfStock': productOutOfStock,
    };
  }
}
