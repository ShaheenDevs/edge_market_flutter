import 'package:edge_market/models/leaderboard_user.dart';
import 'package:stacked/stacked.dart';

class LeaderBoardViewModel extends BaseViewModel {
  final List<LeaderboardUser> _allUsers = [
    LeaderboardUser(
        rank: 1,
        name: 'Bryan Wolf',
        score: 20000,
        avatarPath: 'https://i.pravatar.cc/150?img=1'),
    LeaderboardUser(
        rank: 2,
        name: 'Meghan Jessica',
        score: 14000,
        avatarPath: 'https://i.pravatar.cc/150?img=1'),
    LeaderboardUser(
        rank: 3,
        name: 'Alex Turner',
        score: 6000,
        avatarPath: 'https://i.pravatar.cc/150?img=1'),
    LeaderboardUser(
        rank: 4,
        name: 'Marsha Fisher',
        score: 4000,
        avatarPath: 'https://i.pravatar.cc/150?img=1'),
    LeaderboardUser(
        rank: 5,
        name: 'Juanita Cormier',
        score: 4200,
        avatarPath: 'https://i.pravatar.cc/150?img=1'),
    LeaderboardUser(
        rank: 6,
        name: 'You',
        score: 4000,
        avatarPath: 'https://i.pravatar.cc/150?img=1'),
    LeaderboardUser(
        rank: 7,
        name: 'Tamara Schmidt',
        score: 3500,
        avatarPath: 'https://i.pravatar.cc/150?img=1'),
    LeaderboardUser(
        rank: 8,
        name: 'Ricardo Veum',
        score: 2500,
        avatarPath: 'https://i.pravatar.cc/150?img=1'),
  ];

  List<LeaderboardUser> get topUsers => _allUsers.take(3).toList();

  List<LeaderboardUser> get restUsers => _allUsers.skip(3).toList();
}
