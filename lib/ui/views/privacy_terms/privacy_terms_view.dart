import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'privacy_terms_viewmodel.dart';

class PrivacyTermsView extends StackedView<PrivacyTermsViewModel> {
  const PrivacyTermsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    PrivacyTermsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: const Center(child: Text("PrivacyTermsView")),
      ),
    );
  }

  @override
  PrivacyTermsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      PrivacyTermsViewModel();
}
