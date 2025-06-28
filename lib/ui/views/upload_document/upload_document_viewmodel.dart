import 'package:edge_market/app/app.locator.dart';
import 'package:edge_market/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class UploadDocumentViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  void uploadIdCard() {
    // Implement navigation or camera/gallery logic
  }

  void uploadPassport() {
    // Implement navigation or camera/gallery logic
  }

  void uploadDrivingLicense() {
    // Implement navigation or camera/gallery logic
  }
  submitDocuments() {
    // Implement document submission logic
    _navigationService.replaceWithBottonBarView();
  }
}
