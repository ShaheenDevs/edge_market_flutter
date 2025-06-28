class LeaderboardUser {
  final int id;
  final int rank;
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
        rank: json['rank'],
        fullName: json['fullName'],
        profile: json['profile'],
        withdrawBalance: double.parse(json['withdrawBalance'].toString()),
      );
}
