import 'package:edge_market/ui/views/home/home_view.dart';
import 'package:edge_market/ui/views/leader_board/leader_board_view.dart';
import 'package:edge_market/ui/views/my_network/my_network_view.dart';
import 'package:edge_market/ui/views/profile/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';

import 'botton_bar_viewmodel.dart';

class BottonBarView extends StatefulWidget {
  const BottonBarView({Key? key}) : super(key: key);

  @override
  State<BottonBarView> createState() => _BottonBarViewState();
}

class _BottonBarViewState extends State<BottonBarView>
    with TickerProviderStateMixin {
  late final BottonBarViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = BottonBarViewModel();
    viewModel.initController(this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        bottomNavigationBar: MotionTabBar(
          controller: viewModel.tabController,
          initialSelectedTab: "Home",
          labels: const ["Home", "Leader Board", "My Network", "Profile"],
          icons: const [
            Icons.home,
            Icons.leaderboard,
            Icons.network_check,
            Icons.person
          ],
          tabBarColor: Colors.white,
          tabIconColor: Colors.grey,
          tabIconSelectedColor: Colors.blue,
          tabSelectedColor: Colors.blue.shade50,
          onTabItemSelected: (int value) {
            viewModel.tabController.index = value;
          },
        ),
        body: TabBarView(
          controller: viewModel.tabController,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            HomeView(),
            LeaderBoardView(),
            MyNetworkView(),
            ProfileView(),
          ],
        ),
      ),
    );
  }
}
