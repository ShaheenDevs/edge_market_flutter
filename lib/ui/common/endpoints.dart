// endpoints.dart
class Endpoints {
  static const String baseUrl = 'http://10.0.2.2:3007';

  static const String signUp = '/auth/signup';
  static const String signIn = '/auth/signin';
  static const String getUser = '/auth/getUser';
  static const String updateProfile = '/auth/update';
  static const String deleteUser = '/auth/delete';
  static const String updateVerification = '/auth/verify';

  static const String kyc = '/kyc';
  static const String kycStatus = '/kyc/status';

  static const String leaderboard = '/leaderboard';

  static const String referrals = '/referrals';

  static const String notification = '/notification';

  static const String walletDeposit = "/wallet/deposit";
  static const String walletWithdraw = "/wallet/withdraw";
  static const String walletApprove = "/wallet/approve/";
  static const String walletReject = "/wallet/reject/";
  static const String walletTransactions = "/wallet/transactions/";
  static const String paymentMethods = '/payment';
  static const String version = '/version';

  static const String sendMessage = "/message/sendMessage";
  static const String getMessages = "/message/getMessages";
  static const String getUserChatList = "/message/getUserList";
}
