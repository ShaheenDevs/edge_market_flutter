import 'dart:developer';
import 'dart:io';

import 'package:edge_market/app/app.locator.dart';
import 'package:edge_market/ui/common/ui_helpers.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class UploadDocumentViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final ImagePicker _picker = ImagePicker();

  File? idDocument;
  String? type;

  void uploadIdCard() {
    type = "ID Card";
    uploadDoc();
  }

  void uploadPassport() {
    type = "Passport";
    uploadDoc();
  }

  void uploadDrivingLicense() {
    type = "Driving License";
    uploadDoc();
  }

  uploadDoc() async {
    final picked =
        await _picker.pickImage(source: ImageSource.camera, imageQuality: 85);
    if (picked != null) {
      idDocument = File(picked.path);
      notifyListeners();
      log("ID Document selected: ${picked.path}");
      if (idDocument != null && type != null) {
        _navigationService
            .back(result: {"idDocument": idDocument, "type": type});
      }
    } else {
      log("ID Document selection cancelled.");
    }
  }

  submitDocuments() {
    if (idDocument != null && type != null) {
      _navigationService.back(result: {"idDocument": idDocument, "type": type});
    } else {
      showToast("Please select ID document.");
    }
  }
}
