class WishListItems {
  final String id;

  final String productName;
  final int productPrice;
  final String productImage;

  WishListItems(
      {required this.id,
      required this.productImage,
      required this.productName,
      required this.productPrice});

  factory WishListItems.fromJson(Map<String, dynamic> json) {
    return WishListItems(
      id: json['_id'] ?? '',
      productImage: json['productImage'] ?? '',
      productName: json['productName'] ?? '',
      productPrice: json['productPrice'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'productImage': productImage,
      'productName': productName,
      'productPrice': productPrice,
    };
  }
}
