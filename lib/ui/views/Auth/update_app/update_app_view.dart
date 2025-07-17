import 'package:edge_market/models/app_version.dart';
import 'package:edge_market/ui/common/app_colors.dart';
import 'package:edge_market/ui/widgets/common/background/background.dart';
import 'package:edge_market/ui/widgets/common/button/button.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:url_launcher/url_launcher.dart';
import 'update_app_viewmodel.dart';

class UpdateAppView extends StackedView<UpdateAppViewModel> {
  final AppVersion appVersion;
  final bool showUpdateForceButton;

  const UpdateAppView({
    Key? key,
    required this.appVersion,
    required this.showUpdateForceButton,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    UpdateAppViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: kcBackgroundColor,
      body: Background(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // 🚀 Icon
                const Icon(Icons.update,
                    size: 80, color: kcPrimaryColor),

                const SizedBox(height: 20),

                // Title
                const Text(
                  "🚀 Update Available",
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: kcVeryLightGrey),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 12),

                // Subtitle
                const Text(
                  "A new version of the app is ready to enhance your experience!\nGet the latest features, bug fixes, and performance improvements.",
                  style: TextStyle(fontSize: 16, color: kcVeryLightGrey),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 20),

                // Version Info
                Text(
                  "Version ${appVersion.version} is available.\n${showUpdateForceButton ? 'You must update to continue.' : 'Please consider updating.'}",
                  style: TextStyle(
                      fontSize: 14, color: kcVeryLightGrey.withOpacity(0.7)),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 30),
                Button(
                  btnText: "🔄 Update Now",
                  onClick: () async {
                    final url = Uri.parse(appVersion.url);
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url,
                          mode: LaunchMode.externalApplication);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text("Could not open update link")),
                      );
                    }
                  },
                  bgColor: null,
                ),

                if (!showUpdateForceButton) ...[
                  const SizedBox(height: 15),
                  TextButton(
                    onPressed: viewModel.back,
                    child: const Text(
                      "Skip for now",
                      style: TextStyle(
                        color: kcPrimaryColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  UpdateAppViewModel viewModelBuilder(BuildContext context) =>
      UpdateAppViewModel();
}
