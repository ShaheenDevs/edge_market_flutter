import 'package:edge_market/models/leaderboard.dart';
import 'package:edge_market/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../leader_board_viewmodel.dart';

class LeaderTile extends ViewModelWidget<LeaderBoardViewModel> {
  final LeaderboardUser user;

  const LeaderTile({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context, LeaderBoardViewModel viewModel) {
    final bool isYou = user.fullName.toLowerCase() == 'you';

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
            backgroundImage: user.profile.isNotEmpty
                ? CachedNetworkImageProvider(user.profile) as ImageProvider
                : const AssetImage("assets/images/user_avatar.png")
                    as ImageProvider,
          ),
          horizontalSpaceSmall,
          Expanded(
            child: Text(user.fullName,
                style: const TextStyle(color: Colors.white, fontSize: 15)),
          ),
          Text("${user.withdrawBalance ~/ 1000}k",
              style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
