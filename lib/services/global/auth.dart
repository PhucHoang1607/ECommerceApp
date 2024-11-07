import 'dart:convert';

import 'package:e_commerce_app_project/model/token.dart';
import 'package:e_commerce_app_project/model/user.dart';
import 'package:e_commerce_app_project/services/config.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final secureStorage = FlutterSecureStorage();

// Future<User?> loginUser(String email, String password) async {
//   final url = Uri.parse(Config.loginUrl);
//   final response = await http.post(
//     url,
//     headers: {'Content-Type': 'application/json'},
//     body: jsonEncode({'email': email, 'password': password}),
//   );

//   if (response.statusCode == 200) {
//     final data = jsonDecode(response.body);
//     return User.fromJson(data);
//   } else {
//     return null;
//   }
// }

Future<User?> loginUser(String email, String password) async {
  final response = await http.post(
    Uri.parse(Config.loginUrl), // URL API của bạn
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({'email': email, 'password': password}),
  );

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    print(data);

    // Tạo đối tượng Token từ dữ liệu JSON
    User user = User.fromJson(data);
    //Token token = Token.fromJson(data);
    Token token = Token(
      id: data['_id'],
      userId: user.id,
      accessToken: data['accessToken'],
      refreshToken: data['refreshToken'] ?? '', // xử lý refreshToken nếu cần
      createdAt: DateTime.now(),
    );
    print(token.accessToken);
    // Lưu accessToken và userId vào Flutter Secure Storage
    await secureStorage.write(key: 'accessToken', value: token.accessToken);
    await secureStorage.write(key: 'userId', value: user.id);

    return user;
  } else {
    throw Exception('Failed to login: ${response.body}');
  }
}

Future<String?> getAccessToken() async {
  return await secureStorage.read(key: 'accessToken');
}
