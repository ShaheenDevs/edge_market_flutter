import 'package:edge_market/app/app.locator.dart';
import 'package:edge_market/app/app.router.dart';
import 'package:edge_market/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthService>();
  final _snackbarService = locator<SnackbarService>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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
      _snackbarService.showSnackbar(message: 'Please enter a valid email.');
      return;
    }

    if (password.isEmpty || password.length < 6) {
      _snackbarService.showSnackbar(
        message: 'Password must be at least 6 characters.',
      );
      return;
    }

    setBusy(true);

    final user = await _authService.signIn(email, password);

    setBusy(false);

    if (user != null) {
      _snackbarService.showSnackbar(message: 'Login successful!');
      _navigationService.replaceWithKycView();
    } else {
      _snackbarService.showSnackbar(
        message: 'Login failed. Please check your credentials.',
      );
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
