import 'dart:convert';
import 'dart:developer';
import 'package:edge_market/models/user.dart';
import 'package:edge_market/services/api_service.dart';
import 'package:edge_market/ui/common/endpoints.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final ApiService _apiService = ApiService();
  String error = "";
  Future<UserModel?> signUp(Map<String, dynamic> data) async {
    try {
      final res = await _apiService.post(Endpoints.signUp, data);

      if (res.statusCode == 201 || res.statusCode == 200) {
        Map<String, dynamic> responseData = jsonDecode(res.body);
        if (responseData['data'] != null) {
          final user = UserModel.fromJson(responseData['data']);
          await _saveUser(user);
          return user;
        } else {
          error = jsonDecode(res.body)['message'] ?? 'Sign Up Failed';
          log('Sign Up Failed: Invalid response data');
        }
      } else {
        error = jsonDecode(res.body)['message'] ?? 'Sign Up Failed';
        log('Sign Up Failed: ${res.body}');
      }
    } catch (e) {
      error = 'An error occurred while signing up';
      log('Sign Up Error: $e');
    }
    return null;
  }

  Future<UserModel?> signIn(String email, String password) async {
    try {
      final res = await _apiService.post(
        Endpoints.signIn,
        {"email": email, "password": password},
      );

      if (res.statusCode == 200) {
        Map<String, dynamic> responseData = jsonDecode(res.body);
        if (responseData['data'] != null) {
          final user = UserModel.fromJson(responseData['data']);
          await _saveUser(user);
          return user;
        } else {
          error = jsonDecode(res.body)['message'] ?? 'Sign In Failed';
          log('Sign In Failed: Invalid response data');
        }
      } else {
        error = jsonDecode(res.body)['message'] ?? 'Sign In Failed';
        log('Sign In Failed: ${res.body}');
      }
    } catch (e) {
      error = 'An error occurred while signing in';
      log('Sign In Error: $e');
    }
    return null;
  }

  Future<void> _saveUser(UserModel user) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('token', user.token ?? '');
      prefs.setString('user', jsonEncode(user.toJson()));
    } catch (e) {
      error = 'An error occurred while saving user data';
      log('Save User Error: $e');
    }
  }

  Future<void> logout() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.clear();
    } catch (e) {
      error = 'An error occurred while logging out';
      log('Logout Error: $e');
    }
  }
}
