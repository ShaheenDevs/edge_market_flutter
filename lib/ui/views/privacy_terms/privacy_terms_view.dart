import 'package:edge_market/ui/common/app_colors.dart';
import 'package:edge_market/ui/widgets/common/background/background.dart';
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
      backgroundColor: kcBackgroundColor,
      appBar: AppBar(
        title: const Text('Terms & Conditions',
            style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: const Background(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16),
              Text(
                "By using Edge Market, you agree to the following terms and conditions. Please read them carefully.",
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 12),
              Text(
                "1. Account Responsibility:",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              Text(
                "                                               You are responsible for maintaining the confidentiality of your account and password. Any activity under your account is your responsibility.",
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 12),
              Text(
                "2. Acceptable Use:",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              Text(
                "                                  You agree not to misuse the app for fraudulent, illegal, or abusive activities. Violations may lead to suspension or termination.",
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 12),
              Text(
                "3. Earnings Disclaimer:",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              Text(
                "                                            Edge Market offers rewards based on participation and referrals. We do not guarantee any fixed income.",
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 12),
              Text(
                "4. Modifications:",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              Text(
                "                                We may update these terms at any time. Continued use of the app means you accept any changes.",
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 12),
              Text(
                "5. Contact Us:",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              Text(
                "                          If you have questions about these terms, contact us at support@edgemarket.space.",
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  @override
  PrivacyTermsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      PrivacyTermsViewModel();
}
