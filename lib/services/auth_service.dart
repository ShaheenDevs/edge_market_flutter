// auth_service.dart
import 'dart:convert';
import 'package:edge_market/models/user.dart';
import 'package:edge_market/ui/common/endpoints.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class AuthService {
  Future<UserModel?> signUp(Map<String, dynamic> data) async {
    final res = await http.post(Uri.parse(Endpoints.signUp),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(data));

    if (res.statusCode == 201 || res.statusCode == 200) {
      final user = UserModel.fromJson(jsonDecode(res.body)['data']);
      await _saveUser(user);
      return user;
    }
    return null;
  }

  Future<UserModel?> signIn(String email, String password) async {
    final res = await http.post(Uri.parse(Endpoints.signIn),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({"email": email, "password": password}));

    if (res.statusCode == 200) {
      final user = UserModel.fromJson(jsonDecode(res.body)['data']);
      await _saveUser(user);
      return user;
    }
    return null;
  }

  Future<void> _saveUser(UserModel user) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('token', user.token ?? '');
    prefs.setString('user', jsonEncode(user.toJson()));
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
