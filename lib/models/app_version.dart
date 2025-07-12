class AppVersion {
  final int id;
  final String version;
  final String forceUpdateVersion;
  final String url;

  AppVersion({
    required this.id,
    required this.version,
    required this.forceUpdateVersion,
    required this.url,
  });

  factory AppVersion.fromJson(Map<String, dynamic> json) {
    return AppVersion(
      id: json['id'],
      version: json['version'],
      forceUpdateVersion: json['forceUpdateVersion'],
      url: json['url'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'version': version,
      'forceUpdateVersion': forceUpdateVersion,
      'url': url,
    };
  }
}
