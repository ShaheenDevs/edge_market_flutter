import 'package:edge_market/app/app.locator.dart';
import 'package:edge_market/app/app.router.dart';
import 'package:edge_market/models/user.dart';
import 'package:edge_market/services/auth_service.dart';
import 'package:edge_market/ui/common/ui_helpers.dart' show showToast;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SignupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthService>();

  final nameController = TextEditingController();
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

    final name = nameController.text.trim();
    if (name.isEmpty) {
      showToast('Name cannot be empty');
      setBusy(false);
      return;
    }
    final email = emailController.text.trim();
    if (email.isEmpty) {
      showToast('Email cannot be empty');
      setBusy(false);
      return;
    }
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email)) {
      showToast('Invalid email format');
      setBusy(false);
      return;
    }
    final phone = phoneController.text.trim();
    if (phone.isEmpty) {
      showToast('Phone number cannot be empty');
      setBusy(false);
      return;
    }
    if (!RegExp(r'^\d{10}$').hasMatch(phone)) {
      showToast('Phone number must be 10 digits');
      setBusy(false);
      return;
    }
    final password = passwordController.text.trim();
    if (password.isEmpty) {
      showToast('Password cannot be empty');
      setBusy(false);
      return;
    }
    final fullPhone = '$selectedCountryCode$phone';
    final referral = referralCodeController.text.trim();

    String? cleanedReferral;
    if (referral.isNotEmpty) {
      final words = referral.split(' ');
      if (words.length > 4) {
        cleanedReferral = words.sublist(3).join(' ');
      } else {
        cleanedReferral = '';
      }
    } else {
      cleanedReferral = null;
    }

    final data = {
      "email": email,
      "phoneNo": fullPhone,
      "password": password,
      "referralCode": cleanedReferral ?? 3001
    };

    final user = await _authService.signUp(data);

    setBusy(false);

    if (user.runtimeType == UserModel) {
      showToast(
        'Signup successful!',
      );
      _navigationService.replaceWithLoginView();
    } else {
      showToast(
        _authService.error,
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
