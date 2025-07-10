import 'package:cached_network_image/cached_network_image.dart';
import 'package:edge_market/ui/common/endpoints.dart';
import 'package:edge_market/ui/common/ui_helpers.dart';
import 'package:edge_market/ui/views/home/widgets/animated_line.dart';
import 'package:edge_market/ui/views/home/widgets/transaction_tile.dart';
import 'package:edge_market/ui/widgets/common/background/background.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, HomeViewModel viewModel, Widget? child) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          SafeArea(
            child: Background(
              child: Stack(
                children: [
                  // Animated background waves
                  const AnimatedLines(),
                  // Foreground content
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// Header
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 18,
                                  backgroundImage: viewModel.user?.profile !=
                                          null
                                      ? CachedNetworkImageProvider(
                                              "${Endpoints.baseUrl}/${viewModel.user?.profile}")
                                          as ImageProvider
                                      : const AssetImage(
                                              "assets/images/user_avatar.png")
                                          as ImageProvider,
                                ),
                                horizontalSpaceSmall,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text("Good Day 👋",
                                        style: TextStyle(
                                            color: Colors.white70,
                                            fontSize: 13)),
                                    Text(viewModel.user?.fullName ?? "Guest",
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16)),
                                  ],
                                ),
                              ],
                            ),
                            const CircleAvatar(
                              radius: 24,
                              backgroundColor: Colors.transparent,
                              backgroundImage:
                                  AssetImage("assets/icons/setting.png"),
                            ),
                          ],
                        ),
                        verticalSpaceMedium,

                        /// Balance
                        Center(
                          child: Column(
                            children: [
                              const Text("Available Balance",
                                  style: TextStyle(
                                      color: Colors.white70,
                                      fontWeight: FontWeight.w400)),
                              horizontalSpaceSmall,
                              Text("${viewModel.user?.balance ?? 0.0}",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 36,
                                      fontWeight: FontWeight.bold)),
                              verticalSpaceTiny,
                              Text(
                                  "Referral: ${viewModel.user?.referralCount ?? "0"}",
                                  style: const TextStyle(
                                      color: Colors.white60, fontSize: 12)),
                            ],
                          ),
                        ),
                        verticalSpaceMedium,

                        /// Action Button (Withdraw)
                        // Center(
                        //   child: InkWell(
                        //     onTap: viewModel.showWithdrawBottomSheet,
                        //     child: Container(
                        //       padding: const EdgeInsets.symmetric(
                        //           horizontal: 18, vertical: 10),
                        //       decoration: BoxDecoration(
                        //         color: Colors.white10,
                        //         borderRadius: BorderRadius.circular(100),
                        //       ),
                        //       child: const Column(
                        //         children: [
                        //           Icon(Icons.wallet,
                        //               color: Colors.white, size: 28),
                        //           Text("--withdraw",
                        //               style: TextStyle(
                        //                   color: Colors.redAccent,
                        //                   fontSize: 12)),
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // verticalSpaceMedium,

                        /// Transactions Title
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Latest Transactions",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16)),
                            // Text("See all",
                            //     style: TextStyle(
                            //         color: Colors.white60, fontSize: 12)),
                          ],
                        ),
                        verticalSpaceSmall,

                        /// Transactions List
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: viewModel.transactions.length,
                          itemBuilder: (context, index) {
                            final txn = viewModel.transactions[index];
                            return TransactionTile(
                              icon: txn['type'] == 'deposit'
                                  ? Icons.savings
                                  : Icons.wallet,
                              title: 'Phantom wallet',
                              subtitle: txn['type'] == 'deposit'
                                  ? 'funds added'
                                  : '--withdraw',
                              amount: "\$${txn['amount'].toStringAsFixed(2)}",
                              date: DateTime.parse(txn['createdAt'])
                                  .toLocal()
                                  .toString()
                                  .split(' ')[0],
                              subtitleColor: txn['type'] == 'deposit'
                                  ? Colors.lightBlueAccent
                                  : (txn['status'] == 'approved'
                                      ? Colors.redAccent
                                      : Colors.orangeAccent),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (viewModel.isBusy) const Center(child: CircularProgressIndicator())
        ],
      ),
    );
  }

  @override
  void onViewModelReady(HomeViewModel viewModel) {
    viewModel.onViewModelReady();
    super.onViewModelReady(viewModel);
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();
}
