import 'package:cached_network_image/cached_network_image.dart';
import 'package:edge_market/ui/common/app_colors.dart';
import 'package:edge_market/ui/common/endpoints.dart';
import 'package:edge_market/ui/common/ui_helpers.dart';
import 'package:edge_market/ui/widgets/common/button/button.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../profile_viewmodel.dart';

class ProfileHeader extends ViewModelWidget<ProfileViewModel> {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context, ProfileViewModel viewModel) {
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'My Profile',
              style: TextStyle(
                color: kcWhiteColor,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            CircleAvatar(
              radius: 24,
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage("assets/icons/setting.png"),
            ),
          ],
        ),
        const SizedBox(height: 20),
        CircleAvatar(
          radius: 50,
          backgroundImage: viewModel.user?.profile != null
              ? CachedNetworkImageProvider(
                      "${Endpoints.baseUrl}/${viewModel.user?.profile}")
                  as ImageProvider
              : const AssetImage("assets/images/user_avatar.png")
                  as ImageProvider,
        ),
        verticalSpaceSmall,
        Text(
          viewModel.user?.fullName ?? "",
          style: const TextStyle(
              color: kcWhiteColor, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        Text(
          viewModel.user?.email ?? "",
          style: const TextStyle(color: kcLightGrey, fontSize: 13),
        ),
        verticalSpaceSmall,
        Button(
          onClick: viewModel.onEditProfile,
          btnText: "Edit profile",
          width: 200,
        ),
      ],
    );
  }
}
