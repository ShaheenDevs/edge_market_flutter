// endpoints.dart
class Endpoints {
  static const String baseUrl = 'http://localhost:3007';

  static const String signUp = '/auth/signup';
  static const String signIn = '/auth/signin';
  static const String updateProfile = '/auth/update';
  static const String deleteUser = '/auth/delete';
  static const String updateVerification = '/auth/verify';

  static const String kyc = '/kyc';
  static const String kycStatus = '/kyc/status';

  static const String leaderboard = '/leaderboard';
}
