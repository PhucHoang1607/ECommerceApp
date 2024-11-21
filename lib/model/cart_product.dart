class CartProduct {
  final String id;
  final String product; // Tham chieu san pham
  final int? quantity;
  final String? selectedSize;
  final String? selectedColour;
  final String productName;
  final String productImage;
  final int productPrice;
  final DateTime reservationExpiry;
  final bool? reserved;

  CartProduct({
    required this.id,
    required this.product,
    this.quantity,
    this.selectedSize,
    this.selectedColour,
    required this.productName,
    required this.productImage,
    required this.productPrice,
    required this.reservationExpiry,
    this.reserved,
  });

  factory CartProduct.fromJson(Map<String, dynamic> json) {
    return CartProduct(
      id: json['_id'],
      product: json['product'],
      quantity: json['quantity'] ?? 1,
      selectedSize: json['selectedSize'] ?? '',
      selectedColour: json['selectedColour'] ?? '',
      productName: json['productName'],
      productImage: json['productImage'],
      productPrice: json['productPrice'],
      reservationExpiry: DateTime.parse(json['reservationExpiry']),
      reserved: json['reserved'] ?? 'false',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'product': product,
      'quantity': quantity,
      'selectedSize': selectedSize,
      'selectedColour': selectedColour,
      'productName': productName,
      'productImage': productImage,
      'productPrice': productPrice,
      'reservationExpiry': reservationExpiry,
      'reserved': reserved,
    };
  }
}
