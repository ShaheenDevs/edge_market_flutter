import 'dart:convert';
import 'package:edge_market/app/app.locator.dart';
import 'package:edge_market/models/notification.dart';
import 'package:edge_market/services/api_service.dart';
import 'package:edge_market/ui/common/endpoints.dart';

class NotificationService {
  final ApiService _apiService = locator<ApiService>();

  Future<List<Notification>> getNotifications({int page = 1}) async {
    final res = await _apiService.get('${Endpoints.notification}?page=$page');

    if (res.statusCode == 200) {
      final json = jsonDecode(res.body);
      final data = json['data'] as List;
      return data.map((e) => Notification.fromJson(e)).toList();
    }

    return [];
  }

  Future<Notification?> addNotification({
    required String title,
    required String description,
    String? link,
    String? imageUrl,
  }) async {
    final res = await _apiService.post(
      Endpoints.notification,
      {
        'title': title,
        'description': description,
        if (link != null) 'link': link,
        if (imageUrl != null) 'imageUrl': imageUrl,
      },
    );

    if (res.statusCode == 201) {
      final json = jsonDecode(res.body)['data'];
      return Notification.fromJson(json);
    }

    return null;
  }

  Future<bool> updateNotification({
    required int id,
    required String title,
    required String description,
    String? link,
    String? imageUrl,
  }) async {
    final res = await _apiService.put(
      '${Endpoints.notification}/$id',
      {
        'title': title,
        'description': description,
        if (link != null) 'link': link,
        if (imageUrl != null) 'imageUrl': imageUrl,
      },
    );

    return res.statusCode == 200;
  }

  Future<bool> deleteNotification(int id) async {
    final res = await _apiService.delete('${Endpoints.notification}/$id');
    return res.statusCode == 200;
  }
}
