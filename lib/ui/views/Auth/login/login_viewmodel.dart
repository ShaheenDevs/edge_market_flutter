import 'package:edge_market/app/app.locator.dart';
import 'package:edge_market/app/app.router.dart';
import 'package:edge_market/models/user.dart';
import 'package:edge_market/services/auth_service.dart';
import 'package:edge_market/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthService>();

  final emailController = TextEditingController(text: "xyz@gmail.com");
  final passwordController = TextEditingController(text: "qwerty123");

  bool obscurePassword = true;

  void togglePasswordVisibility() {
    obscurePassword = !obscurePassword;
    notifyListeners();
  }

  Future<void> login() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    // Basic validation
    if (email.isEmpty || !email.contains('@')) {
      showToast('Please enter a valid email.');
      return;
    }

    if (password.isEmpty || password.length < 6) {
      showToast(
        'Password must be at least 8 characters.',
      );
      return;
    }

    setBusy(true);

    final user = await _authService.signIn(email, password);

    setBusy(false);

    if (user.runtimeType == UserModel) {
      showToast('Login successful!');
      if (user?.kycStatus == "not_applied") {
        _navigationService.replaceWithKycView();
      } else if (user?.kycStatus == "approved") {
        _navigationService.replaceWithBottonBarView();
      } else if (user?.kycStatus == "pending") {
        _navigationService.replaceWithKycPendingView();
      } else if (user?.kycStatus == "rejected") {
        _navigationService.replaceWithKycRejectedView();
      }
    } else {
      showToast(_authService.error);
    }
  }

  void navigateToSignup() {
    _navigationService.replaceWithSignupView();
    debugPrint("Navigating to Signup screen");
  }

  void navigateToPrivacyTermsView() {
    _navigationService.navigateToPrivacyTermsView();
    debugPrint("Navigating to Privacy Terms screen");
  }
}
