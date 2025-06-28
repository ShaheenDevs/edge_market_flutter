class UserModel {
  final int id;
  final String fullName;
  final String email;
  final String? phoneNo;
  final String? profile;
  final String? country;
  final String? referralCode;
  final bool emailVerified;
  final String? token;

  UserModel({
    required this.id,
    required this.fullName,
    required this.email,
    this.phoneNo,
    this.profile,
    this.country,
    this.referralCode,
    required this.emailVerified,
    this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        fullName: json['fullName'],
        email: json['email'],
        phoneNo: json['phoneNo'],
        profile: json['profile'],
        country: json['country'],
        referralCode: json['referralCode'],
        emailVerified: json['emailVerified'] ?? false,
        token: json['token'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'fullName': fullName,
        'email': email,
        'phoneNo': phoneNo,
        'profile': profile,
        'country': country,
        'referralCode': referralCode,
        'emailVerified': emailVerified,
        'token': token,
      };
}
