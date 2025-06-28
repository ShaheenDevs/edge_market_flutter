// leaderboard_service.dart
import 'dart:convert';
import 'package:edge_market/models/leaderboard.dart';
import 'package:edge_market/ui/common/endpoints.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class LeaderboardService {
  Future<List<LeaderboardUser>> getLeaderboard() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    final res = await http.get(
      Uri.parse(Endpoints.leaderboard),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (res.statusCode == 200) {
      final data = jsonDecode(res.body)['data'] as List;
      return data.map((e) => LeaderboardUser.fromJson(e)).toList();
    }
    return [];
  }
}
