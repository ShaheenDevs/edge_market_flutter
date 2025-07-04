import 'dart:io';
import 'package:edge_market/ui/views/botton_bar/botton_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:edge_market/app/app.locator.dart';
import 'package:edge_market/app/app.router.dart';
import 'package:edge_market/models/kyc.dart';
import 'package:edge_market/services/kyc_service.dart';
import 'package:edge_market/ui/common/ui_helpers.dart';

class KycViewModel extends BaseViewModel {
  final _kycService = locator<KycService>();
  final _navigationService = locator<NavigationService>();
  final ImagePicker _picker = ImagePicker();

  KycModel? kyc;
  File? idDocument;
  File? selfie;
  String? type;

  /// Pick image from camera for document
  Future<void> takeIdPicture() async {
    final result = await _navigationService.navigateToUploadDocumentView();
    type = result["type"];
    idDocument = result["idDocument"];

    if (idDocument != null && type != null) {
      showToast("Document uploaded successfully");
    } else {
      showToast("Document selection cancelled");
    }

    notifyListeners();
  }

  /// Pick image from camera for selfie
  Future<void> takeSelfie() async {
    final picked = await _picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 85,
    );
    if (picked != null) {
      selfie = File(picked.path);
      notifyListeners();
      showToast("Selfie uploaded successfully");
    } else {
      showToast("Selfie selection cancelled");
    }
  }

  void payForKyc() {
    debugPrint("Redirecting to payment view...");
    submitKyc(paymentId: "123"); // Replace with actual payment ID
  }

  Future<void> submitKyc({required String paymentId}) async {
    if (selfie == null || idDocument == null || type == null) {
      showToast("Please select both selfie and ID document.");
      return;
    }

    setBusy(true);
    try {
      kyc = await _kycService.uploadKyc(
        selfieImage: selfie!,
        documentImage: idDocument!,
        documentType: type!,
        paymentId: paymentId,
      );

      if (kyc != null) {
        showToast("KYC submitted successfully!");
        _navigationService.clearStackAndShowView(const BottonBarView());
      } else {
        showToast("Failed to submit KYC.");
      }
    } catch (e) {
      showToast("Error: ${e.toString()}");
    } finally {
      setBusy(false);
    }
  }
}
