import 'package:edge_market/app/app.locator.dart';
import 'package:edge_market/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

enum WithdrawMethod { crypto, bank }

class WithdrawSheetModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  WithdrawMethod selectedMethod = WithdrawMethod.crypto;

  onChanged(e) {
    selectedMethod = e;
    notifyListeners();
    _navigationService.navigateToWithdrawView();
  }
}
