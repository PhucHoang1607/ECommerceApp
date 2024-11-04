class Token {
  final String id;
  final String userId;
  final String refreshToken;
  final String? accessToken;
  final DateTime createdAt;

  Token({
    required this.id,
    required this.userId,
    required this.refreshToken,
    this.accessToken,
    required this.createdAt,
  });

  factory Token.fromJson(Map<String, dynamic> json) {
    return Token(
      id: json['_id'],
      userId: json['userId'],
      refreshToken: json['refreshToken'],
      accessToken: json['accessToken'],
      createdAt: json['createdAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'userId': userId,
      'refreshToken': refreshToken,
      'accessToken': accessToken,
      'createdAt': createdAt
    };
  }
}
