import 'package:cached_network_image/cached_network_image.dart';
import 'package:edge_market/ui/common/app_colors.dart';
import 'package:edge_market/ui/common/endpoints.dart';
import 'package:edge_market/ui/common/ui_helpers.dart';
import 'package:edge_market/ui/widgets/common/background/background.dart';
import 'package:edge_market/ui/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'my_network_viewmodel.dart';
import 'widgets.dart/build_status_column.dart';

class MyNetworkView extends StackedView<MyNetworkViewModel> {
  const MyNetworkView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    MyNetworkViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: kcBackgroundColor,
      body: SafeArea(
        child: Background(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20),
            child: viewModel.isBusy
                ? const MyLoading()
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'My Network',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(Icons.settings,
                              color: Colors.white.withOpacity(0.6)),
                        ],
                      ),
                      verticalSpaceSmall,

                      // Pending | Accepted Counts
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        decoration: BoxDecoration(
                          color: const Color(0xFF252728),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          children: [
                            MyNetworkBuildStatusColumn(
                                title: "Not Applied",
                                count: viewModel.notAppliedCount),
                            const VerticalDivider(color: Colors.grey, width: 1),
                            MyNetworkBuildStatusColumn(
                                title: "Pending",
                                count: viewModel.pendingCount),
                            const VerticalDivider(color: Colors.grey, width: 1),
                            MyNetworkBuildStatusColumn(
                                title: "Accepted",
                                count: viewModel.acceptedCount),
                          ],
                        ),
                      ),
                      verticalSpaceSmall,
                      const Text(
                        "Earn from your invite — profit is credited once they reach level.",
                        style: TextStyle(color: kcPrimaryColor, fontSize: 12),
                      ),
                      verticalSpaceSmall,

                      // Invitation Code
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18, vertical: 12),
                        decoration: BoxDecoration(
                          color: const Color(0xFF252728),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                viewModel.inviteCode,
                                style: const TextStyle(
                                    fontSize: 16, color: Colors.white),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () =>
                                      viewModel.copyInviteCode(context),
                                  child: const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 8.0),
                                    child:
                                        Icon(Icons.copy, color: kcPrimaryColor),
                                  ),
                                ),
                                InkWell(
                                  onTap: viewModel.share,
                                  child: const Icon(Icons.share,
                                      color: kcPrimaryColor),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      verticalSpaceSmall,

                      const Text(
                        'Members',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      verticalSpaceTiny,

                      // Members List
                      Expanded(
                        child: ListView.builder(
                          itemCount: viewModel.members.length,
                          itemBuilder: (context, index) {
                            final user = viewModel.members[index];
                            return Container(
                              margin: const EdgeInsets.symmetric(vertical: 6),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 10),
                              decoration: BoxDecoration(
                                color: const Color(0xFF252728),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                children: [
                                  // Text("${index + 1}",
                                  //     style: const TextStyle(
                                  //         color: Colors.white, fontSize: 16)),
                                  // const SizedBox(width: 12),
                                  CircleAvatar(
                                    radius: 18,
                                    backgroundImage: user.profile.isNotEmpty
                                        ? CachedNetworkImageProvider(
                                                "${Endpoints.baseUrl}/${user.profile}")
                                            as ImageProvider
                                        : const AssetImage(
                                                "assets/images/user_avatar.png")
                                            as ImageProvider,
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(user.fullName,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 14)),
                                        Text(
                                          user.kycStatus,
                                          style: TextStyle(
                                            color: user.kycStatus == 'pending'
                                                ? Colors.red
                                                : Colors.blue,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text("${user.balance ~/ 1000} k",
                                      style:
                                          const TextStyle(color: Colors.white)),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  @override
  void onViewModelReady(MyNetworkViewModel viewModel) {
    viewModel.onViewModelReady();
    super.onViewModelReady(viewModel);
  }

  @override
  MyNetworkViewModel viewModelBuilder(BuildContext context) =>
      MyNetworkViewModel();
}
