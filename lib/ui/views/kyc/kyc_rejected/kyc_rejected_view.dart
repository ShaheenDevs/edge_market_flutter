import 'package:edge_market/ui/widgets/common/background/background.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'kyc_rejected_viewmodel.dart';

class KycRejectedView extends StackedView<KycRejectedViewModel> {
  const KycRejectedView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    KycRejectedViewModel viewModel,
    Widget? child,
  ) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      body: Background(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.warning_amber_rounded,
                  color: Colors.orange,
                  size: 80,
                ),
                const SizedBox(height: 16),
                Text(
                  "⚠️ KYC Verification Failed",
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.error,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                const Text(
                  "We couldn’t verify your KYC due to the following reasons:\n\n"
                  "📄 Invalid or unclear document uploaded\n\n"
                  "❌ Document mismatch or expired ID\n\n"
                  "💳 Payment could not be verified\n\n"
                  "🕵️‍♂️ Identity information incomplete or incorrect\n\n"
                  "Please recheck your details and try again.",
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 30),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24.0, vertical: 14.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  icon: const Icon(Icons.upload_file),
                  label: const Text(
                    "Re-submit KYC",
                    style: TextStyle(fontSize: 16),
                  ),
                  onPressed: viewModel.navigateToKycView,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  KycRejectedViewModel viewModelBuilder(BuildContext context) =>
      KycRejectedViewModel();
}
