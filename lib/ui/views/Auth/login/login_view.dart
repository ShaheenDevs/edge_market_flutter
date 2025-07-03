import 'package:edge_market/ui/common/app_colors.dart';
import 'package:edge_market/ui/common/ui_helpers.dart';
import 'package:edge_market/ui/widgets/common/background/background.dart';
import 'package:edge_market/ui/widgets/common/button/button.dart';
import 'package:edge_market/ui/widgets/common/custom_text_field/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'login_viewmodel.dart';
import 'widgets.dart/tab_item.dart';

class LoginView extends StackedView<LoginViewModel> {
  const LoginView({super.key});

  @override
  Widget builder(
    BuildContext context,
    LoginViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: kcBackgroundColor,
      body: SafeArea(
        child: Background(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                verticalSpaceMedium,
                const Text(
                  'Edge Market',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: kcWhiteColor,
                  ),
                ),
                verticalSpaceLarge,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const LoginViewTabItem(title: "Login", selected: true),
                    const SizedBox(width: 20),
                    GestureDetector(
                      onTap: viewModel.navigateToSignup,
                      child: const LoginViewTabItem(
                          title: "Signup", selected: false),
                    ),
                  ],
                ),
                verticalSpaceMedium,
                const Text(
                  "Welcome back to the realm.",
                  style: TextStyle(
                    color: kcWhiteColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                verticalSpaceSmall,
                const Text(
                  "Log in to unlock your collection and continue your journey.",
                  style: TextStyle(
                    color: kcVeryLightGrey,
                    fontSize: 13,
                  ),
                  textAlign: TextAlign.center,
                ),
                verticalSpaceMedium,

                /// Email Field
                CustomTextField(
                  title: "Enter your email",
                  borderTitle: "Email",
                  controller: viewModel.emailController,
                  prefix:
                      const Icon(Icons.email_outlined, color: kcPrimaryColor),
                  textClr: Colors.white,
                ),
                verticalSpaceSmall,

                /// Password Field
                CustomTextField(
                  title: "Enter your password",
                  borderTitle: "Password",
                  controller: viewModel.passwordController,
                  prefix: const Icon(Icons.lock_outline, color: kcPrimaryColor),
                  obscureText: viewModel.obscurePassword,
                  textClr: Colors.white,
                  suffixIcon: IconButton(
                    icon: Icon(
                      viewModel.obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: kcPrimaryColor,
                    ),
                    onPressed: viewModel.togglePasswordVisibility,
                  ),
                ),
                verticalSpaceMedium,

                /// Login Button
                Button(
                  btnText: "Singn In",
                  onClick: viewModel.login,
                  bgColor: null,
                ),

                const SizedBox(height: 12),
                InkWell(
                  onTap: () => viewModel.navigateToPrivacyTermsView(),
                  child: const Text(
                    "Privacy & Terms",
                    style: TextStyle(
                      color: kcPrimaryColor,
                      fontSize: 12,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                const Spacer(),
                const Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Language: ',
                        style: TextStyle(color: kcLightGrey),
                      ),
                      TextSpan(
                        text: 'English',
                        style: TextStyle(color: kcPrimaryColor),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  LoginViewModel viewModelBuilder(BuildContext context) => LoginViewModel();
}
