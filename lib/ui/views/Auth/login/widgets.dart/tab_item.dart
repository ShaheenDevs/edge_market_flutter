import 'package:edge_market/ui/common/app_colors.dart';
import 'package:edge_market/ui/common/ui_helpers.dart';
import 'package:edge_market/ui/views/Auth/login/login_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class LoginViewTabItem extends ViewModelWidget<LoginViewModel> {
  final String title;
  final bool selected;
  const LoginViewTabItem({
    super.key,
    required this.title,
    required this.selected,
  });

  @override
  Widget build(
    BuildContext context,
    LoginViewModel viewModel,
  ) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            color: selected ? Colors.white : Colors.grey,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        verticalSpaceTiny,
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: 3,
          width: 60,
          decoration: BoxDecoration(
              color: selected ? kcPrimaryColor : Colors.transparent,
              borderRadius: const BorderRadiusGeometry.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              )),
        ),
      ],
    );
  }
}
