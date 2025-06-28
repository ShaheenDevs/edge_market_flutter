import 'package:edge_market/app/app.locator.dart';
import 'package:edge_market/app/app.router.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool obscurePassword = true;

  void togglePasswordVisibility() {
    obscurePassword = !obscurePassword;
    notifyListeners();
  }

  void login() {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    // Add login logic here (e.g. Firebase, API)
    debugPrint('Email: $email');
    debugPrint('Password: $password');
    _navigationService.replaceWithKycView();
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
