import 'package:edge_market/app/app.locator.dart';
import 'package:edge_market/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class KycRejectedViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  navigateToKycView() {
    _navigationService.navigateToKycView();
  }
}
