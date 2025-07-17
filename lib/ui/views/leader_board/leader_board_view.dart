import 'package:edge_market/ui/common/app_colors.dart';
import 'package:edge_market/ui/common/ui_helpers.dart';
import 'package:edge_market/ui/widgets/common/background/background.dart';
import 'package:edge_market/ui/widgets/loading.dart';
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
      body: SafeArea(
        child: Stack(
          children: [
            Background(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
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
                    Stack(
                      children: [
                        // First user centered at the top
                        if (viewModel.topUsers.length > 1)
                          Center(
                            child: TopUserWidget(
                              user: viewModel.topUsers[0],
                              rank: viewModel.topUsers[0].balance,
                            ),
                          ),

                        // Second and third users in a row
                        Padding(
                          padding: const EdgeInsets.only(top: 35.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              if (viewModel.topUsers.length > 1)
                                TopUserWidget(
                                  user: viewModel.topUsers[1],
                                  rank: viewModel.topUsers[1].balance,
                                ),
                              if (viewModel.topUsers.length > 2)
                                TopUserWidget(
                                  user: viewModel.topUsers[2],
                                  rank: viewModel.topUsers[2].balance,
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    /// Rest of the Leaderboard
                    Expanded(
                      child: ListView.builder(
                        itemCount: viewModel.restUsers.length,
                        itemBuilder: (context, index) {
                          final user = viewModel.restUsers[index];
                          return LeaderTile(user: user);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (viewModel.isBusy) const MyLoading()
          ],
        ),
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
