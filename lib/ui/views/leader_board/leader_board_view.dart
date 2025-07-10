import 'package:edge_market/ui/common/app_colors.dart';
import 'package:edge_market/ui/common/ui_helpers.dart';
import 'package:edge_market/ui/widgets/common/background/background.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'leader_board_viewmodel.dart';
import 'widgets/leader_tile.dart';
import 'widgets/top_user_widget.dart';

class LeaderBoardView extends StackedView<LeaderBoardViewModel> {
  const LeaderBoardView({Key? key}) : super(key: key);

  @override
  Widget builder(
      BuildContext context, LeaderBoardViewModel viewModel, Widget? child) {
    return Scaffold(
      backgroundColor: kcBackgroundColor,
      body: Stack(
        children: [
          Background(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Leader Board",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  verticalSpaceMedium,

                  /// Top 3 Users Section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: viewModel.topUsers
                        .map((user) => TopUserWidget(
                            user: user, rank: user.balance))
                        .toList(),
                  ),

                  const SizedBox(height: 20),

                  /// Rest of the Leaderboard
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: viewModel.restUsers.length,
                    itemBuilder: (context, index) {
                      final user = viewModel.restUsers[index];
                      return LeaderTile(user: user);
                    },
                  ),
                ],
              ),
            ),
          ),
          if (viewModel.isBusy) const CircularProgressIndicator()
        ],
      ),
    );
  }

  @override
  void onViewModelReady(LeaderBoardViewModel viewModel) {
    viewModel.onViewModelReady();
    super.onViewModelReady(viewModel);
  }

  @override
  LeaderBoardViewModel viewModelBuilder(BuildContext context) =>
      LeaderBoardViewModel();
}
