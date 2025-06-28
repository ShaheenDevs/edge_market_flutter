import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../profile_viewmodel.dart';

class ProfileFooter extends ViewModelWidget<ProfileViewModel> {
  const ProfileFooter({super.key});

  @override
  Widget build(BuildContext context, ProfileViewModel viewModel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton.icon(
          onPressed: viewModel.onLogout,
          icon: const Icon(Icons.logout, color: Colors.pink),
          label: const Text(
            "Logout",
            style: TextStyle(color: Colors.pink),
          ),
        ),
        const Text(
          "Language: English",
          style: TextStyle(color: Colors.white70),
        ),
      ],
    );
  }
}
