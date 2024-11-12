import 'dart:convert';

import 'package:e_commerce_app_project/model/token.dart';
import 'package:e_commerce_app_project/model/user.dart';
import 'package:e_commerce_app_project/services/config.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final secureStorage = FlutterSecureStorage();

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

Future<Map<String, dynamic>> registerUser({
  required String name,
  required String email,
  required String password,
  required String phone,
  DateTime? dateOfBirth,
}) async {
  final url = Uri.parse(Config.registerUrl);
  final headers = {'Content-Type': 'application/json'};

  final body = json.encode({
    'name': name,
    'email': email,
    'password': password,
    'phone': phone,
    'dateOfBirth': dateOfBirth,
  });

  try {
    final response = await http.post(url, headers: headers, body: body);
    if (response.statusCode == 201) {
      return json.decode(response.body);
    } else if (response.statusCode == 400 || response.statusCode == 409) {
      return {'error': json.decode(response.body)['message']};
    } else {
      return {'error': 'Unexpected error occurred'};
    }
  } catch (e) {
    return {'error': 'Failed to connect to server: $e'};
  }
}

Future<String> forgetPassword(String email) async {
  final url = Uri.parse(Config.forgotPasswordUrl);

  try {
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email}),
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      return responseData['message'];
    } else {
      final errorData = jsonDecode(response.body);
      return errorData['message'];
    }
  } catch (e) {
    return 'An error occurred: $e';
  }
}

Future<String> verifyPasswordResetOTP(String email, String otp) async {
  final url = Uri.parse(Config.verifyPasswordResetOTPUrl);
  try {
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'otp': otp}),
    );
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      return responseData['message'];
    } else {
      final errorData = jsonDecode(response.body);
      return errorData['message'];
    }
  } catch (e) {
    return 'An error occurred: $e';
  }
}
