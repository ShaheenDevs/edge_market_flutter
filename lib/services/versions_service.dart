import 'dart:convert';
import 'package:edge_market/models/app_version.dart';
import 'package:edge_market/services/api_service.dart';
import 'package:edge_market/ui/common/endpoints.dart';

class AppVersionService {
  final ApiService _apiService = ApiService();
  AppVersion? appVersion;

  Future<AppVersion> getVersion() async {
    final response = await _apiService.get(Endpoints.version);
    final data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      appVersion = AppVersion.fromJson(data['data']);
      return appVersion!;
    } else {
      throw Exception(data['message']);
    }
  }

  Future<void> updateVersion(AppVersion version) async {
    final response = await _apiService.put(
      Endpoints.version,
      version.toJson(),
    );
    final data = jsonDecode(response.body);

    if (response.statusCode != 200) {
      throw Exception(data['message']);
    }
  }
}
