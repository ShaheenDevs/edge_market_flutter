class UserModel {
  final int id;
  final String fullName;
  final String email;
  final String phoneNo;
  final String? profile;
  final String password;
  final String? country;
  final String? referralCode;
  final bool emailVerified;
  final int balance;
  final int withdrawBalance;
  final int? referralBy;
  final int? referralCount;
  final String language;
  final String kycStatus;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String token;
  final String expiresIn;

  UserModel({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phoneNo,
    this.profile,
    required this.password,
    this.country,
    this.referralCode,
    required this.emailVerified,
    required this.balance,
    required this.withdrawBalance,
    this.referralBy,
    this.referralCount,
    required this.language,
    required this.kycStatus,
    required this.createdAt,
    required this.updatedAt,
    required this.token,
    required this.expiresIn,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? -1,
      fullName: json['fullName'] ?? '',
      email: json['email'] ?? '',
      phoneNo: json['phoneNo'] ?? '',
      profile: json['profile'],
      password: json['password'] ?? '',
      country: json['country'],
      referralCode: json['referralCode'],
      emailVerified: json['emailVerified'] ?? false,
      balance: json['balance'] ?? 0,
      withdrawBalance: json['withdrawBalance'] ?? 0,
      referralBy: json['referralBy'],
      referralCount: json['referralCount'],
      language: json['language'] ?? 'English',
      kycStatus: json['kycStatus'] ?? 'not_applied',
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      token: json['token'] ?? '',
      expiresIn: json['expiresIn'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'email': email,
      'phoneNo': phoneNo,
      'profile': profile,
      'password': password,
      'country': country,
      'referralCode': referralCode,
      'emailVerified': emailVerified,
      'balance': balance,
      'withdrawBalance': withdrawBalance,
      'referralBy': referralBy,
      'referralCount': referralCount,
      'language': language,
      'kycStatus': kycStatus,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'token': token,
      'expiresIn': expiresIn,
    };
  }
}
