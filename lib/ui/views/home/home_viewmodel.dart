import 'dart:developer';

import 'package:edge_market/app/app.bottomsheets.dart';
import 'package:edge_market/app/app.locator.dart';
import 'package:edge_market/models/user.dart';
import 'package:edge_market/services/auth_service.dart';
import 'package:edge_market/services/wallet.dart';
import 'package:edge_market/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final _bottomSheetService = locator<BottomSheetService>();
  final _authService = locator<AuthService>();
  final _walletService = locator<WalletService>();

  UserModel? get user => _authService.user;

  List<Map<String, dynamic>> _transactions = [];
  List<Map<String, dynamic>> get transactions => _transactions;

  void showWithdrawBottomSheet() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.withdraw,
      title: ksHomeBottomSheetTitle,
      description: ksHomeBottomSheetDescription,
    );
  }

  onViewModelReady() {
    fetchTransactions();
  }

  Future<void> fetchTransactions() async {
    if (user == null) return;
    setBusy(true);
    notifyListeners();

    try {
      _transactions = await _walletService.getUserTransactions(user!.id);
      log(_transactions.length.toString());
    } catch (e) {
      _transactions = [];
    }

    setBusy(false);
    notifyListeners();
  }
}
