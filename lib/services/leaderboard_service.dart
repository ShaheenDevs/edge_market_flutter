// leaderboard_service.dart
import 'dart:convert';
import 'package:edge_market/app/app.locator.dart';
import 'package:edge_market/models/leaderboard.dart';
import 'package:edge_market/services/api_service.dart';
import 'package:edge_market/ui/common/endpoints.dart';

class LeaderboardService {
  final ApiService _apiService = locator<ApiService>();

  Future<List<LeaderboardUser>> getLeaderboard() async {
    final res = await _apiService.get(Endpoints.leaderboard);

    if (res.statusCode == 200) {
      final data = jsonDecode(res.body)['data'] as List;
      return data.map((e) => LeaderboardUser.fromJson(e)).toList();
    }
    return [];
  }
}
