import 'package:edge_market/ui/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class MyLoading extends StatelessWidget {
  const MyLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.twistingDots(
        leftDotColor: kcPrimaryColor,
        rightDotColor: kcScendryColor,
        size: 50,
      ),
    );
  }
}
