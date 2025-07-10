class LeaderboardUser {
  final int id;
  int? rank;
  final String fullName;
  final String profile;
  final double balance;

  LeaderboardUser({
    required this.id,
    required this.rank,
    required this.fullName,
    required this.profile,
    required this.balance,
  });

  factory LeaderboardUser.fromJson(Map<String, dynamic> json) =>
      LeaderboardUser(
        id: json['id'],
        rank: json['rank'] ?? 0,
        fullName: json['fullName'] ?? "",
        profile: json['profile'] ?? "",
        balance: double.parse(json['balance'].toString()),
      );
}
