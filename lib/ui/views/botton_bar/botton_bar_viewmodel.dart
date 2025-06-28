import 'package:flutter/material.dart';
import 'package:motion_tab_bar_v2/motion-tab-controller.dart';
import 'package:stacked/stacked.dart';

class BottonBarViewModel extends BaseViewModel {
  late MotionTabBarController tabController;

  void initController(TickerProvider ticker) {
    tabController = MotionTabBarController(
      initialIndex: 0,
      length: 4,
      vsync: ticker,
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
}
