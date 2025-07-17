import 'package:edge_market/ui/widgets/common/background/background.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:edge_market/ui/common/app_colors.dart';
import 'package:edge_market/ui/common/ui_helpers.dart';
import 'upload_document_viewmodel.dart';
import 'widgets/upload_document_view.dart';

class UploadDocumentView extends StackedView<UploadDocumentViewModel> {
  const UploadDocumentView({super.key});

  @override
  Widget builder(
      BuildContext context, UploadDocumentViewModel viewModel, Widget? child) {
    return Scaffold(
      backgroundColor: kcBackgroundColor,
      body: SafeArea(
        child: Background(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Back Button
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios, color: kcWhiteColor),
                  onPressed: () => Navigator.pop(context),
                ),
                verticalSpaceSmall,

                // Illustration Image
                Center(
                  child: Image.asset(
                    'assets/images/upload_doc_illustration.png',
                    height: 150,
                  ),
                ),
                verticalSpaceMedium,

                const Text(
                  "Upload proof of your identity",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: kcWhiteColor,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  "Please submit a document below",
                  style: TextStyle(color: kcVeryLightGrey, fontSize: 13),
                ),
                verticalSpaceMedium,

                // Option: ID Card
                UploadDocumentBuildOptionTile(
                  icon: Icons.credit_card,
                  label: "ID Card",
                  onTap: viewModel.uploadIdCard,
                ),
                verticalSpaceSmall,

                // Option: Passport
                UploadDocumentBuildOptionTile(
                  icon: Icons.book_outlined,
                  label: "Passport",
                  onTap: viewModel.uploadPassport,
                ),
                verticalSpaceSmall,

                // Option: Driving License
                UploadDocumentBuildOptionTile(
                  icon: Icons.drive_eta_outlined,
                  label: "Driving License",
                  onTap: viewModel.uploadDrivingLicense,
                ),
                verticalSpaceLarge,

                // /// Create Account Button
                // Button(
                //   btnText: "Submit Documents",
                //   onClick: viewModel.submitDocuments,
                //   useGradient: true,
                // ),
                // const Spacer(),

                // // Footer
                // const Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Text("Logout", style: TextStyle(color: Colors.redAccent)),
                //     Text.rich(
                //       TextSpan(
                //         children: [
                //           TextSpan(
                //             text: 'Language: ',
                //             style: TextStyle(color: kcVeryLightGrey),
                //           ),
                //           TextSpan(
                //             text: 'English',
                //             style: TextStyle(color: Colors.redAccent),
                //           ),
                //         ],
                //       ),
                //     ),
                //   ],
                // ),
                // verticalSpaceSmall,
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  UploadDocumentViewModel viewModelBuilder(BuildContext context) =>
      UploadDocumentViewModel();
}
