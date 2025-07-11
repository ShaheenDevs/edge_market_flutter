import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:edge_market/ui/common/app_colors.dart';
import 'package:edge_market/ui/common/ui_helpers.dart';

import '../upload_document_viewmodel.dart';

class UploadDocumentBuildOptionTile
    extends ViewModelWidget<UploadDocumentViewModel> {
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
  Widget build(BuildContext context, UploadDocumentViewModel viewModel) {
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
            viewModel.type == label
                ? const Icon(Icons.check, color: kcPrimaryColor)
                : const Icon(Icons.chevron_right, color: kcWhiteColor),
          ],
        ),
      ),
    );
  }
}
