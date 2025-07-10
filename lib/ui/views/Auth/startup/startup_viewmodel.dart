import 'package:edge_market/models/user.dart';
import 'package:edge_market/services/api_service.dart';
import 'package:edge_market/services/auth_service.dart';
import 'package:edge_market/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:edge_market/app/app.locator.dart';
import 'package:edge_market/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthService>();

  // Place anything here that needs to happen before we get into the application
  Future<void> runStartupLogic() async {
    // Get token from ApiService (if needed for headers/auth)
    await locator<ApiService>().getToken();

    // Try to get the locally saved user
    UserModel? localUser = await _authService.getLocalUser();

    // Wait 3 seconds (maybe for splash screen delay)
    // await Future.delayed(const Duration(seconds: 3));

    // Check if user exists
    if (localUser != null) {
      // Try to sign in again using saved credentials
      final user = await _authService.getUser(0);

      if (user is UserModel) {
        // Navigate based on KYC status
        if (user.kycStatus == "not_applied") {
          _navigationService.replaceWithKycView();
        } else if (user.kycStatus == "approved") {
          _navigationService.replaceWithBottonBarView();
        } else if (user.kycStatus == "pending") {
          _navigationService.replaceWithKycPendingView();
        } else if (user.kycStatus == "rejected") {
          _navigationService.replaceWithKycPendingView();
        }
      } else {
        showToast(_authService.error);
      }
    } else {
      // No local user, go to login screen
      _navigationService.replaceWithLoginView();
    }
  }
}
