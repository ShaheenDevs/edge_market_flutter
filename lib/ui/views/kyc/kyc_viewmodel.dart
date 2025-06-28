import 'package:edge_market/app/app.locator.dart';
import 'package:edge_market/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

class KycViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  void takeIdPicture() {
    debugPrint("Opening camera for ID...");
    // Add image picker or camera logic here
  }

  void takeSelfie() {
    debugPrint("Opening camera for selfie...");
    // Add image picker or camera logic here
  }

  void payForKyc() {
    _navigationService.replaceWithUploadDocumentView();
    debugPrint("Paying for KYC...");
    // Integrate Stripe, Razorpay, or other payment gateway here
  }
}
