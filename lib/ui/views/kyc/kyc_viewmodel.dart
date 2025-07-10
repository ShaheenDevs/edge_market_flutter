import 'dart:developer';
import 'dart:io';
import 'package:edge_market/app/app.bottomsheets.dart';
import 'package:edge_market/models/payment.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:edge_market/app/app.locator.dart';
import 'package:edge_market/app/app.router.dart';
import 'package:edge_market/models/kyc.dart';
import 'package:edge_market/services/kyc_service.dart';
import 'package:edge_market/services/payments_service.dart';
import 'package:edge_market/ui/common/ui_helpers.dart';
import 'package:edge_market/ui/views/botton_bar/botton_bar_view.dart';

class KycViewModel extends BaseViewModel {
  final _kycService = locator<KycService>();
  final _paymentService = locator<PaymentMethodService>();
  final _navigationService = locator<NavigationService>();
  final _bottomSheetService = locator<BottomSheetService>();

  final ImagePicker _picker = ImagePicker();

  KycModel? kyc;
  File? idDocument;
  File? selfie;
  File? paymentProof;
  PaymentMethod? selectedPaymentMethod;
  String? type;
  List<PaymentMethod> allMethods = [];

  onViewModelReady() async {
    allMethods = await _paymentService.getAllMethods();
    notifyListeners();
  }

  Future<void> takeIdPicture() async {
    final result = await _navigationService.navigateToUploadDocumentView();
    if (result != null) {
      type = result["type"];
      idDocument = result["idDocument"];
    }
    if (idDocument != null && type != null) {
      showToast("Document uploaded successfully");
    } else {
      showToast("Document selection cancelled");
    }

    notifyListeners();
  }

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

  selectPaymentMethod() async {
    final response = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.paymentMethod,
      title: "Choose Method",
      description: "Select the payment method used",
      data: allMethods,
    );

    if (response?.confirmed == true && response?.data != null) {
      selectedPaymentMethod = response!.data;
      log('User selected: ${selectedPaymentMethod?.accountName} - ${selectedPaymentMethod?.accountNumber}');
    }
  }

  uploadPaymentProof() async {
    final picked = await _picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      paymentProof = File(picked.path);
      notifyListeners();
      showToast("Payment Proof uploaded successfully");
    } else {
      showToast("Payment Proof selection cancelled");
    }
  }

  Future<void> submitKyc() async {
    if (selfie == null ||
        idDocument == null ||
        paymentProof == null ||
        type == null) {
      showToast("Please select both selfie and ID document.");
      return;
    }

    setBusy(true);
    try {
      kyc = await _kycService.uploadKyc(
        selfieImage: selfie!,
        documentImage: idDocument!,
        paymentProof: paymentProof!,
        documentType: type!,
        payment: "5000",
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
