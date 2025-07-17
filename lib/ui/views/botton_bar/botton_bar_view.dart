import 'package:edge_market/ui/common/app_colors.dart';
import 'package:edge_market/ui/views/home/home_view.dart';
import 'package:edge_market/ui/views/leader_board/leader_board_view.dart';
import 'package:edge_market/ui/views/my_network/my_network_view.dart';
import 'package:edge_market/ui/views/profile/profile_view.dart';
import 'package:flutter/material.dart';

class BottonBarView extends StatefulWidget {
  const BottonBarView({Key? key}) : super(key: key);

  @override
  State<BottonBarView> createState() => _BottonBarViewState();
}

class _BottonBarViewState extends State<BottonBarView> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    HomeView(),
    LeaderBoardView(),
    MyNetworkView(),
    ProfileView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcBackgroundColor,
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: kcPrimaryColor,
        unselectedItemColor: Colors.grey,
        backgroundColor: kcBackgroundColor,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(fontSize: 12),
        unselectedLabelStyle: const TextStyle(fontSize: 12),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.leaderboard),
            label: "Leader Board",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.network_check),
            label: "My Network",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
