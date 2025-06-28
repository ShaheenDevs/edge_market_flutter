class Member {
  final int rank;
  final String name;
  final String avatarPath;
  final String status; // 'pending' or 'accepted'
  final int score;

  Member({
    required this.rank,
    required this.name,
    required this.avatarPath,
    required this.status,
    required this.score,
  });
}
