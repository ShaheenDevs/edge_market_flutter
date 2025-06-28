import 'package:edge_market/app/app.locator.dart';
import 'package:edge_market/app/app.router.dart';
import 'package:edge_market/models/user.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ProfileViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  final UserProfile user = UserProfile(
    name: "Ali khan",
    email: "alikhan.business8@gmail.com",
    avatar: "https://i.pravatar.cc/150?img=13",
  );

  void onEditProfile() {
    // Navigate to Edit Profile
  }

  void onNotifications() {
    // Navigate to Notifications
  }

  void onWithdraw() {
    _navigationService.navigateToWithdrawView();
    // Navigate to Withdraw screen
  }

  void onChatSupport() {
    // Open support chat
  }

  void onPrivacy() {
    // Show Privacy & Terms
  }

  void onLogout() {
    // Logout logic
  }
}
