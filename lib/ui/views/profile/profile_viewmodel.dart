import 'package:edge_market/app/app.locator.dart';
import 'package:edge_market/app/app.router.dart';
import 'package:edge_market/models/user.dart';
import 'package:edge_market/services/auth_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ProfileViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthService>();

  UserModel? get user => _authService.user;

  void onEditProfile() {
    // Navigate to Edit Profile
  }

  void onNotifications() {
    _navigationService.navigateToNotificationView();
  }

  void onWithdraw() {
    _navigationService.navigateToWithdrawView();
    // Navigate to Withdraw screen
  }

  void onChatSupport() {
    _navigationService.navigateToChatSupportView();
  }

  void onPrivacy() {
    _navigationService.navigateToPrivacyTermsView();
  }

  Future<void> onLogout() async {
    await _authService.logout();
    _navigationService.clearStackAndShow(Routes.loginView);
  }
}
