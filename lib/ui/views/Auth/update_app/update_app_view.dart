import 'package:edge_market/models/app_version.dart';
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
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "A new version of the app is available!",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Text(
                "Version ${appVersion.version} is available. "
                "${showUpdateForceButton ? 'You must update to continue.' : 'Please consider updating.'}",
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () async {
                  final url = Uri.parse(appVersion.url);
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url, mode: LaunchMode.externalApplication);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text("Could not open update link")),
                    );
                  }
                },
                child: const Text("Update Now"),
              ),
              if (!showUpdateForceButton) ...[
                const SizedBox(height: 15),
                TextButton(
                  onPressed: viewModel.back,
                  child: const Text("Skip for now"),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  @override
  UpdateAppViewModel viewModelBuilder(BuildContext context) =>
      UpdateAppViewModel();
}
