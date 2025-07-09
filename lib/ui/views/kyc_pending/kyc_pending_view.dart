import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'kyc_pending_viewmodel.dart';

class KycPendingView extends StackedView<KycPendingViewModel> {
  const KycPendingView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    KycPendingViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: const Center(child: Text("KycPendingView")),
      ),
    );
  }

  @override
  KycPendingViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      KycPendingViewModel();
}
