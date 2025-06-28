import 'package:edge_market/models/leaderboard_user.dart';
import 'package:edge_market/ui/common/app_colors.dart';
import 'package:edge_market/ui/common/ui_helpers.dart';
import 'package:edge_market/ui/widgets/common/background/background.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'leader_board_viewmodel.dart';
import 'package:cached_network_image/cached_network_image.dart';

class LeaderBoardView extends StackedView<LeaderBoardViewModel> {
  const LeaderBoardView({Key? key}) : super(key: key);

  @override
  Widget builder(
      BuildContext context, LeaderBoardViewModel viewModel, Widget? child) {
    return Scaffold(
      backgroundColor: kcBackgroundColor,
      body: Background(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20),
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
                    .map((user) => _TopUserWidget(user: user, rank: user.rank))
                    .toList(),
              ),

              const SizedBox(height: 20),

              /// Rest of the Leaderboard
              Expanded(
                child: ListView.builder(
                  itemCount: viewModel.restUsers.length,
                  itemBuilder: (context, index) {
                    final user = viewModel.restUsers[index];
                    return _LeaderTile(user: user);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  LeaderBoardViewModel viewModelBuilder(BuildContext context) =>
      LeaderBoardViewModel();
}

class _TopUserWidget extends StatelessWidget {
  final LeaderboardUser user;
  final int rank;

  const _TopUserWidget({required this.user, required this.rank});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: CircleAvatar(
                radius: 30,
                backgroundImage: CachedNetworkImageProvider(
                  "${user.avatarPath}${user.rank}",
                ),
              ),
            ),
            Positioned(
              bottom: -0,
              child: CircleAvatar(
                radius: 12,
                backgroundColor: Colors.blue,
                child: Text("${user.rank}",
                    style: const TextStyle(color: Colors.white, fontSize: 12)),
              ),
            ),
          ],
        ),
        verticalSpaceTiny,
        Text(user.name,
            style: const TextStyle(color: Colors.white, fontSize: 14)),
        Text("${(user.score / 1000).toStringAsFixed(0)}k",
            style: const TextStyle(color: Colors.grey)),
        if (rank == 2) (verticalSpaceMedium)
      ],
    );
  }
}

class _LeaderTile extends StatelessWidget {
  final LeaderboardUser user;

  const _LeaderTile({required this.user});

  @override
  Widget build(BuildContext context) {
    final bool isYou = user.name.toLowerCase() == 'you';

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: isYou ? const Color(0xFFEC5B73) : const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Text("${user.rank}",
              style: const TextStyle(color: Colors.white, fontSize: 16)),
          horizontalSpaceSmall,
          CircleAvatar(
              radius: 18,
              backgroundImage: CachedNetworkImageProvider(
                "${user.avatarPath}${user.rank}",
              )),
          horizontalSpaceSmall,
          Expanded(
            child: Text(user.name,
                style: const TextStyle(color: Colors.white, fontSize: 15)),
          ),
          Text("${user.score ~/ 1000}k",
              style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
