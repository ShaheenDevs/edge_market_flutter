import 'package:edge_market/models/leaderboard.dart';
import 'package:edge_market/models/user.dart';
import 'package:edge_market/services/auth_service.dart';
import 'package:edge_market/services/leaderboard_service.dart';
import 'package:edge_market/app/app.locator.dart';
import 'package:stacked/stacked.dart';

class LeaderBoardViewModel extends BaseViewModel {
  final _leaderboardService = locator<LeaderboardService>();
  final _authService = locator<AuthService>();


  UserModel? get user => _authService.user;
  List<LeaderboardUser> _allUsers = [];

  List<LeaderboardUser> get topUsers => _allUsers.take(3).toList();
  List<LeaderboardUser> get restUsers => _allUsers.skip(3).toList();

  onViewModelReady() {
    fetchLeaderboard();
  }

  Future<void> fetchLeaderboard() async {
    setBusy(true);
    _allUsers = await _leaderboardService.getLeaderboard();

    // Sort by withdrawBalance descending
    // allUsers.sort((a, b) => b.withdrawBalance.compareTo(a.withdrawBalance));

    // Assign ranks
    for (int i = 0; i < _allUsers.length; i++) {
      _allUsers[i].rank = i + 1;
    }

    setBusy(false);
    notifyListeners();
  }
}
