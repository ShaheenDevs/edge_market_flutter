import 'package:edge_market/models/user.dart';
import 'package:edge_market/services/api_service.dart';
import 'package:edge_market/services/auth_service.dart';
import 'package:stacked/stacked.dart';
import 'package:edge_market/app/app.locator.dart';
import 'package:edge_market/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  // Place anything here that needs to happen before we get into the application
  Future runStartupLogic() async {
    locator<ApiService>().getToken();
    UserModel? user = await locator<AuthService>().getLocalUser();

    await Future.delayed(const Duration(seconds: 3));

    // This is where you can make decisions on where your app should navigate when
    // you have custom startup logic
    if (user != null) {
      _navigationService.replaceWithBottonBarView();
    } else {
      _navigationService.replaceWithLoginView();
    }
  }
}
