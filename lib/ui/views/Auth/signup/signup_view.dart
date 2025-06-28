import 'package:edge_market/ui/views/Auth/signup/widgets.dart/tab_item.dart';
import 'package:edge_market/ui/widgets/common/background/background.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:edge_market/ui/common/app_colors.dart';
import 'package:edge_market/ui/common/ui_helpers.dart';
import 'package:edge_market/ui/widgets/common/custom_text_field/custom_text_field.dart';
import 'package:edge_market/ui/widgets/common/button/button.dart';
import 'signup_viewmodel.dart';

class SignupView extends StackedView<SignupViewModel> {
  const SignupView({super.key});

  @override
  Widget builder(
    BuildContext context,
    SignupViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: kcBackgroundColor,
      body: SafeArea(
        child: Background(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
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
                    GestureDetector(
                      onTap: viewModel.navigateToLogin,
                      child: const SignupViewTabItem(
                          title: "Login", selected: false),
                    ),
                    const SizedBox(width: 20),
                    const SignupViewTabItem(title: "Signup", selected: true),
                  ],
                ),
                verticalSpaceMedium,
                const Text(
                  "Begin your quest.",
                  style: TextStyle(
                    color: kcWhiteColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                verticalSpaceSmall,
                const Text(
                  "Create an account to discover, collect, and trade digital treasures.",
                  style: TextStyle(
                    color: kcVeryLightGrey,
                    fontSize: 13,
                  ),
                  textAlign: TextAlign.center,
                ),
                verticalSpaceMedium,

                /// Email
                CustomTextField(
                  title: "Enter your email",
                  borderTitle: "Email",
                  controller: viewModel.emailController,
                  prefix:
                      const Icon(Icons.email_outlined, color: kcPrimaryColor),
                  textClr: Colors.white,
                ),
                verticalSpaceSmall,

                /// Phone
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 58,
                        decoration: BoxDecoration(
                          color: const Color(0xFF1E1E1E),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: viewModel.selectedCountryCode,
                              dropdownColor: const Color(0xFF1E1E1E),
                              icon: const Icon(Icons.keyboard_arrow_down,
                                  color: Colors.white),
                              onChanged: viewModel.updateCountryCode,
                              items: viewModel.countryCodes
                                  .map((code) => DropdownMenuItem(
                                        value: code,
                                        child: Text(
                                          code,
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                      ))
                                  .toList(),
                            ),
                          ),
                        ),
                      ),
                    ),
                    horizontalSpaceSmall,
                    Expanded(
                      flex: 5,
                      child: CustomTextField(
                        title: "1234567890",
                        borderTitle: "",
                        controller: viewModel.phoneController,
                        textClr: Colors.white,
                      ),
                    ),
                  ],
                ),
                verticalSpaceSmall,

                /// Referral Code (Optional)
                const Row(
                  children: [
                    Text("Referral Code",
                        style: TextStyle(color: kcWhiteColor)),
                    Spacer(),
                    Text("(Optional)",
                        style: TextStyle(color: kcVeryLightGrey)),
                  ],
                ),
                verticalSpaceTiny,
                CustomTextField(
                  title: "Enter Referral Code",
                  controller: viewModel.referralCodeController,
                  prefix: const Icon(Icons.code, color: kcPrimaryColor),
                  textClr: Colors.white,
                ),
                verticalSpaceSmall,

                /// Password
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

                /// Create Account Button
                Button(
                  btnText: "Create Account",
                  onClick: viewModel.signup,
                  useGradient: true,
                ),

                verticalSpaceSmall,
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
                          style: TextStyle(color: kcLightGrey)),
                      TextSpan(
                          text: 'English',
                          style: TextStyle(color: kcPrimaryColor)),
                    ],
                  ),
                ),
                verticalSpaceSmall,
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  SignupViewModel viewModelBuilder(BuildContext context) => SignupViewModel();
}
