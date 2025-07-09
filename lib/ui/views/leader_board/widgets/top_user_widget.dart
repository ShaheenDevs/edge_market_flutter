import 'package:edge_market/models/leaderboard.dart';
import 'package:edge_market/ui/common/endpoints.dart';
import 'package:edge_market/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../leader_board_viewmodel.dart';

class TopUserWidget extends ViewModelWidget<LeaderBoardViewModel> {
  final LeaderboardUser user;
  final double rank;

  const TopUserWidget({Key? key, required this.user, required this.rank})
      : super(key: key);

  @override
  Widget build(BuildContext context, LeaderBoardViewModel viewModel) {
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
                backgroundImage: user.profile.isNotEmpty
                    ? CachedNetworkImageProvider(
                        "${Endpoints.baseUrl}/${user.profile}") as ImageProvider
                    : const AssetImage("assets/images/user_avatar.png")
                        as ImageProvider,
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
        Text(user.fullName,
            style: const TextStyle(color: Colors.white, fontSize: 14)),
        Text("${(user.withdrawBalance / 1000).toStringAsFixed(0)}k",
            style: const TextStyle(color: Colors.grey)),
        if (rank == 2) (verticalSpaceMedium)
      ],
    );
  }
}
