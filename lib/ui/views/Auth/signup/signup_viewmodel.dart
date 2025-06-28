import 'package:edge_market/app/app.locator.dart';
import 'package:edge_market/app/app.router.dart';
import 'package:edge_market/models/user.dart';
import 'package:edge_market/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SignupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthService>();
  final _snackbarService = locator<SnackbarService>();

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

  Future<void> signup() async {
    setBusy(true);

    final email = emailController.text.trim();
    final phone = phoneController.text.trim();
    final password = passwordController.text.trim();
    final referral = referralCodeController.text.trim();

    final fullPhone = '$selectedCountryCode$phone';

    final data = {
      "email": email,
      "phoneNo": fullPhone,
      "password": password,
      "referralCode": referral
    };

    final user = await _authService.signUp(data);

    setBusy(false);

    if (user.runtimeType == UserModel) {
      _snackbarService.showSnackbar(
        message: 'Signup successful!',
      );
      _navigationService.replaceWithBottonBarView();
    } else {
      _snackbarService.showSnackbar(
        message: _authService.error,
      );
    }
  }

  void navigateToLogin() {
    _navigationService.replaceWithLoginView();
  }

  void navigateToPrivacyTermsView() {
    _navigationService.navigateToPrivacyTermsView();
    debugPrint("Navigating to Privacy Terms screen");
  }
}
