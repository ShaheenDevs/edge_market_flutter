import 'package:edge_market/models/leaderboard.dart';
import 'package:stacked/stacked.dart';

class LeaderBoardViewModel extends BaseViewModel {
  final List<LeaderboardUser> _allUsers = [
    LeaderboardUser(
        id: 1,
        rank: 1,
        fullName: 'Bryan Wolf',
        withdrawBalance: 20000,
        profile: 'https://i.pravatar.cc/150?img=1'),
    LeaderboardUser(
        id: 2,
        rank: 2,
        fullName: 'Meghan Jessica',
        withdrawBalance: 14000,
        profile: 'https://i.pravatar.cc/150?img=1'),
    LeaderboardUser(
        id: 3,
        rank: 3,
        fullName: 'Alex Turner',
        withdrawBalance: 6000,
        profile: 'https://i.pravatar.cc/150?img=1'),
    LeaderboardUser(
        id: 4,
        rank: 4,
        fullName: 'Marsha Fisher',
        withdrawBalance: 4000,
        profile: 'https://i.pravatar.cc/150?img=1'),
    LeaderboardUser(
        id: 5,
        rank: 5,
        fullName: 'Juanita Cormier',
        withdrawBalance: 4200,
        profile: 'https://i.pravatar.cc/150?img=1'),
    LeaderboardUser(
        id: 6,
        rank: 6,
        fullName: 'You',
        withdrawBalance: 4000,
        profile: 'https://i.pravatar.cc/150?img=1'),
    LeaderboardUser(
        id: 7,
        rank: 7,
        fullName: 'Tamara Schmidt',
        withdrawBalance: 3500,
        profile: 'https://i.pravatar.cc/150?img=1'),
    LeaderboardUser(
        id: 8,
        rank: 8,
        fullName: 'Ricardo Veum',
        withdrawBalance: 2500,
        profile: 'https://i.pravatar.cc/150?img=1'),
  ];

  List<LeaderboardUser> get topUsers => _allUsers.take(3).toList();

  List<LeaderboardUser> get restUsers => _allUsers.skip(3).toList();
}
