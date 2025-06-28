import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'background_model.dart';

class Background extends StackedView<BackgroundModel> {
  final Widget? child;
  final String gifPath;

  const Background({
    super.key,
    this.gifPath = "assets/images/background.png",
    this.child,
  });

  @override
  Widget builder(
    BuildContext context,
    BackgroundModel viewModel,
    Widget? childWidget,
  ) {
    return Stack(
      fit: StackFit.expand,
      children: [
        /// GIF Background
        Image.asset(
          gifPath,
          fit: BoxFit.cover,
        ),

        /// Foreground content
        if (child != null) child!,
      ],
    );
  }

  @override
  BackgroundModel viewModelBuilder(BuildContext context) => BackgroundModel();
}
