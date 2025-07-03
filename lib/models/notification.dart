class Notification {
  final int id;
  final int userId;
  final String title;
  final String description;
  final String? link;
  final String? imageUrl;
  final DateTime createdAt;
  final DateTime updatedAt;

  Notification({
    required this.id,
    required this.userId,
    required this.title,
    required this.description,
    this.link,
    this.imageUrl,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Notification.fromJson(Map<String, dynamic> json) {
    return Notification(
      id: json['id'],
      userId: json['userId'],
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      link: json['link'],
      imageUrl: json['imageUrl'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "userId": userId,
      "title": title,
      "description": description,
      "link": link,
      "imageUrl": imageUrl,
      "createdAt": createdAt.toIso8601String(),
      "updatedAt": updatedAt.toIso8601String(),
    };
  }
}
