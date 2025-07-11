import 'package:edge_market/app/app.locator.dart';
import 'package:edge_market/models/user.dart';
import 'package:edge_market/services/auth_service.dart';
import 'package:edge_market/services/wallet.dart';
import 'package:edge_market/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class WithdrawViewModel extends BaseViewModel {
  final _authService = locator<AuthService>();
  final _walletService = locator<WalletService>();

  UserModel? get user => _authService.user;

  final TextEditingController amountController = TextEditingController();
  final TextEditingController walletAddressController = TextEditingController();

  final List<String> paymetMethodOptions = [
    'JazzCash',
    'EasyPaisa',
    'UBL',
    'HBL',
    "Al Falah",
  ];

  String? selectedPaymetMethod;

  double get parsedAmount {
    try {
      return double.parse(amountController.text);
    } catch (_) {
      return 0.0;
    }
  }

  double get platformFee => parsedAmount * 0.02;
  double get finalAmount => parsedAmount - platformFee;

  onViewModelReady() {
    _authService.getUser(user?.id ?? 0);
    notifyListeners();
  }

  updateAmount(e) {
    final amount = amountController.text.trim();
    if (amount.isEmpty) {
      return 'Amount cannot be empty';
    }
    if (double.tryParse(amount) == null || double.parse(amount) <= 0) {
      return 'Please enter a valid amount';
    }
    notifyListeners();
    return null;
  }

  void setPaymetMethod(String? value) {
    selectedPaymetMethod = value;
    notifyListeners();
  }

  Future<void> submitWithdraw() async {
    setBusy(true);
    final totalBalance = user?.balance ?? 0;
    final trimmedWallet = walletAddressController.text.trim();

    if (parsedAmount > totalBalance) {
      showToast("❌ Withdrawal failed: Insufficient balance.");
      setBusy(false);
      return;
    }
    if (parsedAmount <= 0) {
      showToast("❌ Withdrawal failed: Amount must be greater than zero.");
      setBusy(false);
      return;
    }
    if (selectedPaymetMethod == null) {
      showToast("❌ Withdrawal failed: Please select a payment method.");
      setBusy(false);
      return;
    }
    if (trimmedWallet.isEmpty) {
      showToast("❌ Withdrawal failed: Please enter your account number.");
      setBusy(false);
      return;
    }
    try {
      bool res = await _walletService.requestWithdrawal(
        amount: parsedAmount,
        userId: user?.id ?? 0,
        description:
            "Withdrawal Request\nPayment Method: $selectedPaymetMethod\nWallet Address: $trimmedWallet",
      );
      if (res) {
        showToast("✅ Withdrawal request submitted successfully.");
        amountController.clear();
        walletAddressController.clear();
        selectedPaymetMethod = null;
        notifyListeners();
      } else {
        showToast("❌ Withdrawal failed: Please try again later.");
      }
    } catch (_) {
      showToast("❌ Withdrawal failed: Invalid account number format.");
    }

    setBusy(false);

    debugPrint("✅ Withdraw Requested");
    debugPrint("Amount: $parsedAmount");
    debugPrint("PaymentMethod: $selectedPaymetMethod");
    debugPrint("Wallet: $trimmedWallet");
  }

  onDispose() {
    _authService.getUser(user?.id ?? 0);
  }
}
