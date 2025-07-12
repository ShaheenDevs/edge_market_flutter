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
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: const Center(child: Text("KycRejectedView")),
      ),
    );
  }

  @override
  KycRejectedViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      KycRejectedViewModel();
}
