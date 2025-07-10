class Member {
  final int id;
  final String fullName;
  final String email;
  final String profile;
  final int balance;
  final String kycStatus;

  Member({
    required this.id,
    required this.fullName,
    required this.email,
    required this.profile,
    required this.balance,
    required this.kycStatus,
  });

  factory Member.fromJson(Map<String, dynamic> json) {
    return Member(
      id: json['id'] ?? 0,
      fullName: json['fullName'] ?? 'Unknown',
      email: json['email'] ?? '',
      profile: json['profile'] ?? '',
      balance: json['balance'] ?? 0,
      kycStatus: json['kycStatus'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'fullName': fullName,
        'email': email,
        'profile': profile,
        'balance': balance,
        'kycStatus': kycStatus,
      };
}
