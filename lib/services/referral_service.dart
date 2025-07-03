import 'dart:convert';
import 'package:edge_market/models/member.dart';
import 'package:edge_market/services/api_service.dart';
import 'package:edge_market/ui/common/endpoints.dart';

class ReferralService {
  final ApiService _apiService = ApiService();

  Future<List<Member>> getReferrals(int? userId) async {
    final res = await _apiService.get("${Endpoints.referrals}/$userId");

    if (res.statusCode == 200) {
      final data = jsonDecode(res.body)['data'] as List;
      return data.map((e) => Member.fromJson(e)).toList();
    }

    return [];
  }
}
