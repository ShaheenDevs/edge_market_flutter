class LeaderboardUser {
  final int id;
  int? rank;
  final String fullName;
  final String profile;
  final double withdrawBalance;

  LeaderboardUser({
    required this.id,
    required this.rank,
    required this.fullName,
    required this.profile,
    required this.withdrawBalance,
  });

  factory LeaderboardUser.fromJson(Map<String, dynamic> json) =>
      LeaderboardUser(
        id: json['id'],
        rank: json['rank'] ?? 0,
        fullName: json['fullName'] ?? "",
        profile: json['profile'] ?? "",
        withdrawBalance: double.parse(json['withdrawBalance'].toString()),
      );
}
