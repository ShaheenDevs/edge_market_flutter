import 'package:edge_market/ui/common/app_colors.dart';
import 'package:edge_market/ui/common/ui_helpers.dart';
import 'package:edge_market/ui/widgets/common/background/background.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'profile_viewmodel.dart';
import 'widgets/profile_header.dart';
import 'widgets/profile_option_tile.dart';
import 'widgets/profile_footer.dart';

class ProfileView extends StackedView<ProfileViewModel> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ProfileViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: kcBackgroundColor,
      body: SafeArea(
        child: Background(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const ProfileHeader(),
                verticalSpaceSmall,
                Expanded(
                  child: ListView(
                    children: [
                      ProfileOptionTile(
                        icon: "assets/icons/notifications.png",
                        label: 'Notifications',
                        onTap: viewModel.onNotifications,
                      ),
                      ProfileOptionTile(
                        icon: "assets/icons/my_withdraw.png",
                        label: 'My withdraw',
                        onTap: viewModel.onWithdraw,
                      ),
                      ProfileOptionTile(
                        icon: "assets/icons/chat_support.png",
                        label: 'Chat Support',
                        onTap: viewModel.onChatSupport,
                      ),
                      ProfileOptionTile(
                        icon: "assets/icons/privacy_terms.png",
                        label: 'Privacy & Terms',
                        onTap: viewModel.onPrivacy,
                      ),
                    ],
                  ),
                ),
                const ProfileFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  ProfileViewModel viewModelBuilder(BuildContext context) => ProfileViewModel();
}
