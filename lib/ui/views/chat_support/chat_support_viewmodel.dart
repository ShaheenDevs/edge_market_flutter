import 'package:edge_market/app/app.locator.dart';
import 'package:edge_market/models/message.dart';
import 'package:edge_market/models/user.dart';
import 'package:edge_market/services/auth_service.dart';
import 'package:edge_market/services/chat_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ChatSupportViewModel extends BaseViewModel {
  // final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthService>();
  final _chatService = locator<ChatService>();

  final TextEditingController messageController = TextEditingController();

  UserModel? get user => _authService.user;
  List<Message> messages = [];
  int get currentUserId => user?.id ?? -1;
  int supportUserId = 3001;

  ChatSupportViewModel() {
    initChat();
  }

  Future<void> initChat() async {
    setBusy(true);
    try {
      messages = await _chatService.getMessages(
        senderId: currentUserId,
        receiverId: supportUserId,
        page: 1,
        limit: 100,
      );
      messages = messages.reversed.toList();
    } catch (e) {
      debugPrint("Error loading chat: $e");
    }
    setBusy(false);
  }

  Future<void> sendMessage() async {
    final text = messageController.text.trim();
    if (text.isEmpty) return;

    try {
      final sentMessage = await _chatService.sendMessage(
        senderId: currentUserId,
        receiverId: supportUserId,
        message: text,
      );
      messages.insert(0, sentMessage);
      messageController.clear();
      notifyListeners();
    } catch (e) {
      debugPrint("Error sending message: $e");
    }
  }

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }
}
