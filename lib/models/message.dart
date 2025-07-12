class Message {
  final int id;
  final int senderId;
  final int receiverId;
  final String message;
  final String messageType;
  final bool seen;
  final DateTime createdAt;

  Message({
    required this.id,
    required this.senderId,
    required this.receiverId,
    required this.message,
    required this.messageType,
    required this.seen,
    required this.createdAt,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json['id'],
      senderId: json['senderId'],
      receiverId: json['receiverId'],
      message: json['message'],
      messageType: json['messageType'] ?? 'text',
      seen: json['seen'] ?? false,
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}
