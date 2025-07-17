import 'package:edge_market/ui/views/kyc/widgets/kyc_view.dart';
import 'package:edge_market/ui/widgets/common/background/background.dart';
import 'package:edge_market/ui/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:edge_market/ui/common/app_colors.dart';
import 'package:edge_market/ui/common/ui_helpers.dart';
import 'package:edge_market/ui/widgets/common/button/button.dart';
import 'kyc_viewmodel.dart';

class KycView extends StackedView<KycViewModel> {
  const KycView({super.key});

  @override
  Widget builder(BuildContext context, KycViewModel viewModel, Widget? child) {
    return Scaffold(
      backgroundColor: kcBackgroundColor,
      body: Stack(
        children: [
          SafeArea(
            child: Background(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    verticalSpaceMedium,
                    Center(
                      child: Image.asset(
                        'assets/images/kyc_illustration.png', // Replace with your image asset
                        height: 200,
                      ),
                    ),
                    verticalSpaceMedium,
                    const Text(
                      "Let's verify KYC",
                      style: TextStyle(
                        color: kcWhiteColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    verticalSpaceSmall,
                    const Text(
                      "Please submit the following documents verify your profile",
                      style: TextStyle(
                        color: kcVeryLightGrey,
                        fontSize: 13,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    verticalSpaceLarge,

                    /// 1. Take a picture of your ID
                    KycOptionTile(
                      icon: Icons.badge_outlined,
                      title: "Take a picture of your valid ID",
                      subtitle:
                          "To check your personal information are correct",
                      onTap: viewModel.takeIdPicture,
                      selected: viewModel.idDocument != null &&
                          viewModel.type != null,
                    ),
                    verticalSpaceSmall,

                    /// 2. Take a selfie
                    KycOptionTile(
                      icon: Icons.camera_alt_outlined,
                      title: "Take a selfie of yourself",
                      subtitle: "To match your face to your ID photo",
                      onTap: viewModel.takeSelfie,
                      selected: viewModel.selfie != null,
                    ),
                    verticalSpaceSmall,
                    KycOptionTile(
                      icon: Icons.account_balance_wallet_outlined,
                      title: "Select Payment Method",
                      subtitle:
                          "Choose how you paid (e.g. JazzCash, Easypaisa)",
                      onTap: viewModel.selectPaymentMethod,
                      selected: viewModel.selectedPaymentMethod != null,
                    ),
                    verticalSpaceSmall,
                    KycOptionTile(
                      icon: Icons.upload_file_rounded,
                      title: "Upload Payment Proof",
                      subtitle: "Screenshot or receipt of your payment",
                      onTap: viewModel.uploadPaymentProof,
                      selected: viewModel.paymentProof != null,
                    ),
                    verticalSpaceLarge,

                    /// Pay Button
                    Button(
                      btnText: "Submit KYC",
                      onClick: () {
                        viewModel.submitKyc();
                      },
                      useGradient: true,
                    ),
                    verticalSpaceTiny,
                    const Text(
                      "kyc will cost you 5000 please pay to get verified",
                      style: TextStyle(color: kcVeryLightGrey, fontSize: 11),
                    ),
                    const Spacer(),

                    /// Footer Row
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Logout", style: TextStyle(color: kcPrimaryColor)),
                        // Text.rich(
                        //   TextSpan(
                        //     children: [
                        //       TextSpan(
                        //           text: 'Language: ',
                        //           style: TextStyle(color: kcLightGrey)),
                        //       TextSpan(
                        //           text: 'English',
                        //           style: TextStyle(color: kcPrimaryColor)),
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                    verticalSpaceSmall,
                  ],
                ),
              ),
            ),
          ),
          if (viewModel.isBusy) const MyLoading()
        ],
      ),
    );
  }

  @override
  void onViewModelReady(KycViewModel viewModel) {
    viewModel.onViewModelReady();
    super.onViewModelReady(viewModel);
  }

  @override
  KycViewModel viewModelBuilder(BuildContext context) => KycViewModel();
}
