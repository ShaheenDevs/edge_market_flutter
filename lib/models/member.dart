class Member {
  final int rank;
  final String name;
  final String avatarPath;
  final String kycStatus;
  final int score;

  Member({
    required this.rank,
    required this.name,
    required this.avatarPath,
    required this.kycStatus,
    required this.score,
  });

  factory Member.fromJson(Map<String, dynamic> json) {
    return Member(
      rank: json['rank'] ?? 0,
      name: json['name'] ?? 'Unknown',
      avatarPath: json['avatarPath'] ?? '',
      kycStatus: json['kycStatus'] ?? '',
      score: json['score'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        'rank': rank,
        'name': name,
        'avatarPath': avatarPath,
        'kycStatus': kycStatus,
        'score': score,
      };
}
