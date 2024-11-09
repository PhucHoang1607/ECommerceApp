import 'package:e_commerce_app_project/model/product.dart';

class OrderItems {
  final String id;
  final String product; // Tham chieu san pham
  final String productName;
  final String productImage;
  final int productPrice;
  final int? quantity;
  final String? selectedSize;
  final String? selectedColour;

  OrderItems({
    required this.id,
    required this.product,
    required this.productName,
    required this.productImage,
    required this.productPrice,
    this.quantity,
    this.selectedSize,
    this.selectedColour,
  });

  factory OrderItems.fromJson(Map<String, dynamic> json) {
    return OrderItems(
      id: json['_id'],
      product: json['product'] ?? '',
      productName: json['productName'] ?? '',
      productImage: json['productImage'] ?? "",
      productPrice: json['productPrice'],
      quantity: json['quantity'] ?? 1,
      selectedSize: json['selectedSize'] ?? '',
      selectedColour: json['selectedColour'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'product': product,
      'productName': productName,
      'productImage': productImage,
      'productPrice': productPrice,
      'quantity': quantity,
      'selectedSize': selectedSize,
      'selectedColour': selectedColour,
    };
  }
}
