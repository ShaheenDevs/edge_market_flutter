import 'package:edge_market/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:stacked/stacked.dart';
import 'package:edge_market/ui/common/app_colors.dart';
import 'startup_viewmodel.dart';

class StartupView extends StackedView<StartupViewModel> {
  const StartupView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    StartupViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          /// Background GIF
          Image.asset(
            'assets/images/splash_loader.gif',
            fit: BoxFit.cover,
          ),

          /// Foreground content
          const Center(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Text(
                        'Welcome to\nEdge Market',
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.w400,
                          color: kcWhiteColor,
                        ),
                      ),
                    ],
                  ),
                  verticalSpaceMassive,
                  verticalSpaceMassive,
                  verticalSpaceMassive,
                  verticalSpaceMassive,
                  Text(
                    'Explore and Mint NFTs',
                    style: TextStyle(
                      fontSize: 19.82,
                      fontWeight: FontWeight.w400,
                      color: kcWhiteColor,
                    ),
                  ),
                  verticalSpaceSmall,
                  Text(
                    'You can buy and sell the NFTs of the best artists\nin the world.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 11.71,
                      fontWeight: FontWeight.w400,
                      color: kcWhiteColor,
                    ),
                  ),
                  verticalSpaceSmall,
                  Text(
                    'Get started now',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: kcWhiteColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  StartupViewModel viewModelBuilder(BuildContext context) => StartupViewModel();

  @override
  void onViewModelReady(StartupViewModel viewModel) {
    SchedulerBinding.instance.addPostFrameCallback(
      (_) => viewModel.runStartupLogic(),
    );
  }
}
