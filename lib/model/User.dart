class User {
  final String id;
  final String name;
  final String email;
  final String passwordHash;
  final String? paymentCustomerId;
  final String? address;
  final String? gender;
  final DateTime? dateOfBirth;
  final String phone;
  final bool isAdmin;
  final double? resetPasswordOTP;
  final DateTime? resetPasswordOTPExpires;
  final List<dynamic>? cart;
  final List<Map<String, dynamic>>? wishlists;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.passwordHash,
    this.paymentCustomerId,
    this.address,
    this.gender,
    this.dateOfBirth,
    required this.phone,
    this.isAdmin = false,
    this.resetPasswordOTP,
    this.resetPasswordOTPExpires,
    this.cart = const [],
    this.wishlists = const [],
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      name: json['name'],
      email: json['email'],
      passwordHash: json['passwordHash'] ?? '',
      paymentCustomerId: json['paymentCustomerId'] ?? '',
      address: json['address'] ?? '',
      gender: json['gender'] ?? '',
      dateOfBirth: json['dateOfBirth'] ?? DateTime.now(),
      phone: json['phone'] ?? '',
      isAdmin: json['isAdmin'] ?? false,
      resetPasswordOTP: json['resetPasswordOTP'],
      resetPasswordOTPExpires: json['resetPasswordOTPExpires'] != null
          ? DateTime.parse(json['resetPasswordOTPExpires'])
          : DateTime(
              DateTime.now().year, DateTime.now().month, DateTime.now().day),
      cart: json['cart'] ?? [],
      wishlists: List<Map<String, dynamic>>.from(json['wishlists'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'email': email,
      'passwordHash': passwordHash,
      'paymentCustomerId': passwordHash,
      'address': address,
      'gender': gender,
      'dateOfBirth': dateOfBirth,
      'phone': phone,
      'isAdmin': isAdmin,
      'resetPasswordOTP': resetPasswordOTP,
      'resetPasswordOTPExpires': resetPasswordOTPExpires,
      'cart': cart,
      'wishlists': wishlists,
    };
  }
}
