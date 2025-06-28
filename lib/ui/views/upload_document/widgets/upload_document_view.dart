import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:edge_market/ui/common/app_colors.dart';
import 'package:edge_market/ui/common/ui_helpers.dart';

import '../upload_document_viewmodel.dart';

class UploadDocumentBuildOptionTile
    extends StackedView<UploadDocumentViewModel> {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  const UploadDocumentBuildOptionTile({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget builder(
      BuildContext context, UploadDocumentViewModel viewModel, Widget? child) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(icon, color: kcWhiteColor),
            horizontalSpaceMedium,
            Expanded(
              child: Text(
                label,
                style: const TextStyle(
                  color: kcWhiteColor,
                  fontSize: 16,
                ),
              ),
            ),
            const Icon(Icons.chevron_right, color: kcWhiteColor),
          ],
        ),
      ),
    );
  }

  @override
  UploadDocumentViewModel viewModelBuilder(BuildContext context) =>
      UploadDocumentViewModel();
}
