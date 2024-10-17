import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/user_model.dart';

class AuthRemoteDataSource {
  final String apiUrl = "https://sports-app-alpha.vercel.app/api/v1/auth/login";

  Future<UserModel> login(String email, String password) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({"email": email, "password": password}),
    );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      return UserModel.fromJson(responseData['data']);
    } else {
      throw Exception('Failed to log in');
    }
  }
}
