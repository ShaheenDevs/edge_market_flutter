import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class WithdrawViewModel extends BaseViewModel {
  final TextEditingController amountController = TextEditingController();
  final TextEditingController walletAddressController = TextEditingController();

  final List<String> blockchainOptions = [
    'Binance Smart Chain (BEP20)',
    'Ethereum (ERC20)',
    'TRON (TRC20)',
    'Polygon (MATIC)',
  ];

  String? selectedBlockchain;

  double get parsedAmount {
    try {
      return double.parse(amountController.text);
    } catch (_) {
      return 0.0;
    }
  }

  double get platformFee => parsedAmount * 0.20;
  double get finalAmount => parsedAmount - platformFee;

  void setBlockchain(String? value) {
    selectedBlockchain = value;
    notifyListeners();
  }

  void submitWithdraw() {
    debugPrint("Withdraw Requested");
    debugPrint("Amount: $parsedAmount");
    debugPrint("Blockchain: $selectedBlockchain");
    debugPrint("Wallet: ${walletAddressController.text}");
  }
}
