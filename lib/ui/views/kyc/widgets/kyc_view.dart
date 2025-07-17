import 'package:edge_market/ui/common/ui_helpers.dart';
import 'package:edge_market/ui/views/kyc/kyc_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:edge_market/ui/common/app_colors.dart';

class KycOptionTile extends StackedView<KycViewModel> {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final bool selected;

  const KycOptionTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    required this.selected,
  });

  @override
  Widget builder(BuildContext context, KycViewModel viewModel, Widget? child) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: kcWhiteColor,
              size: 45,
            ),
            horizontalSpaceSmall,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        color: kcWhiteColor, fontWeight: FontWeight.w600),
                  ),
                  horizontalSpaceTiny,
                  Text(
                    subtitle,
                    style:
                        const TextStyle(color: kcVeryLightGrey, fontSize: 12),
                  ),
                ],
              ),
            ),
            selected
                ? const Icon(Icons.check_circle, color: kcPrimaryColor)
                : const Icon(Icons.chevron_right, color: kcVeryLightGrey),
          ],
        ),
      ),
    );
  }

  @override
  KycViewModel viewModelBuilder(BuildContext context) => KycViewModel();
}
