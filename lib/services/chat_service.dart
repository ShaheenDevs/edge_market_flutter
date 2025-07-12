import 'dart:convert';
import 'package:edge_market/models/message.dart';
import 'package:edge_market/services/api_service.dart';
import 'package:edge_market/ui/common/endpoints.dart';

class ChatService {
  final ApiService _apiService = ApiService();

  /// Send a message from sender to receiver
  Future<Message> sendMessage({
    required int senderId,
    required int receiverId,
    required String message,
  }) async {
    final response = await _apiService.post(
      Endpoints.sendMessage,
      {
        'senderId': senderId,
        'receiverId': receiverId,
        'message': message,
      },
    );

    final data = jsonDecode(response.body);
    if (response.statusCode == 201) {
      return Message.fromJson(data['data']);
    } else {
      throw Exception(data['message']);
    }
  }

  /// Get messages between two users with pagination
  Future<List<Message>> getMessages({
    required int senderId,
    required int receiverId,
    int page = 1,
    int limit = 20,
  }) async {
    final response = await _apiService.get(
      "${Endpoints.getMessages}?senderId=$senderId&receiverId=$receiverId&page=$page&limit=$limit",
    );

    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      List list = data['data'];
      return list.map((e) => Message.fromJson(e)).toList();
    } else {
      throw Exception(data['message']);
    }
  }

  /// Get user chat list (recent conversations)
  // Future<List<ChatUser>> getUserChatList({
  //   required int userId,
  //   int page = 1,
  //   int limit = 10,
  // }) async {
  //   final response = await _apiService.get(
  //     "${Endpoints.getUserChatList}?userId=$userId&page=$page&limit=$limit",
  //   );
  //   final data = jsonDecode(response.body);
  //   if (response.statusCode == 200) {
  //     List list = data['data'];
  //     return list.map((e) => ChatUser.fromJson(e)).toList();
  //   } else {
  //     throw Exception(data['message']);
  //   }
  // }
}
