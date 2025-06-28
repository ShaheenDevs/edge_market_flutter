import 'package:edge_market/app/app.locator.dart';
import 'package:edge_market/app/app.router.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SignupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final referralCodeController = TextEditingController();

  bool obscurePassword = true;

  List<String> countryCodes = ['+92', '+91', '+1'];
  String selectedCountryCode = '+92';

  void togglePasswordVisibility() {
    obscurePassword = !obscurePassword;
    notifyListeners();
  }

  void updateCountryCode(String? code) {
    if (code != null) {
      selectedCountryCode = code;
      notifyListeners();
    }
  }

  void signup() {
    final email = emailController.text.trim();
    final phone = phoneController.text.trim();
    final password = passwordController.text.trim();
    final referral = referralCodeController.text.trim();

    debugPrint("Email: $email");
    debugPrint("Phone: $selectedCountryCode $phone");
    debugPrint("Password: $password");
    debugPrint("Referral Code: $referral");

    // Add real signup logic (API/Firebase) here
  }

  void navigateToLogin() {
    _navigationService.replaceWithLoginView();
  }

  void navigateToPrivacyTermsView() {
    _navigationService.navigateToPrivacyTermsView();
    debugPrint("Navigating to Privacy Terms screen");
  }
}
