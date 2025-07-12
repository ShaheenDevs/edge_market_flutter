import 'package:edge_market/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class UpdateAppViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  back() {
    _navigationService.back(result: true);
  }
}
