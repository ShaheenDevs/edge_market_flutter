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
      body: SafeArea(
        child: Background(
          child: Stack(
            children: [
              // Animated background waves
              const AnimatedLines(),
              // Foreground content
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Header
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 24,
                              backgroundColor: Colors.transparent,
                              backgroundImage:
                                  AssetImage("assets/images/user_avatar.png"),
                            ),
                            horizontalSpaceSmall,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Good Day 👋",
                                    style: TextStyle(
                                        color: Colors.white70, fontSize: 13)),
                                Text("SAM SMITH",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16)),
                              ],
                            ),
                          ],
                        ),
                        CircleAvatar(
                          radius: 24,
                          backgroundColor: Colors.transparent,
                          backgroundImage:
                              AssetImage("assets/icons/setting.png"),
                        ),
                      ],
                    ),
                    verticalSpaceMedium,

                    /// Balance
                    const Center(
                      child: Column(
                        children: [
                          Text("Available Balance",
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontWeight: FontWeight.w400)),
                          horizontalSpaceSmall,
                          Text("\$ 14,000",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 36,
                                  fontWeight: FontWeight.bold)),
                          verticalSpaceTiny,
                          Text("Referral: 3       Level: 1",
                              style: TextStyle(
                                  color: Colors.white60, fontSize: 12)),
                        ],
                      ),
                    ),
                    verticalSpaceMedium,

                    /// Action Button (Withdraw)
                    Center(
                      child: InkWell(
                        onTap: viewModel.showWithdrawBottomSheet,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 18, vertical: 10),
                          decoration: BoxDecoration(
                            color: Colors.white10,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: const Column(
                            children: [
                              Icon(Icons.wallet, color: Colors.white, size: 28),
                              Text("--withdraw",
                                  style: TextStyle(
                                      color: Colors.redAccent, fontSize: 12)),
                            ],
                          ),
                        ),
                      ),
                    ),
                    verticalSpaceMedium,

                    /// Transactions Title
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Latest Transactions",
                            style:
                                TextStyle(color: Colors.white, fontSize: 16)),
                        Text("See all",
                            style:
                                TextStyle(color: Colors.white60, fontSize: 12)),
                      ],
                    ),
                    verticalSpaceSmall,

                    /// Transactions List
                    Expanded(
                      child: ListView(
                        children: const [
                          TransactionTile(
                            icon: Icons.wallet,
                            title: "Phantom wallet",
                            subtitle: "--withdraw",
                            amount: "\$1,760",
                            date: "12th June 2025",
                            subtitleColor: Colors.redAccent,
                          ),
                          TransactionTile(
                            icon: Icons.wallet,
                            title: "Phantom wallet",
                            subtitle: "--withdraw",
                            amount: "\$1,760",
                            date: "12th June 2025",
                            subtitleColor: Colors.redAccent,
                          ),
                          TransactionTile(
                            icon: Icons.savings,
                            title: "Phantom wallet",
                            subtitle: "funds added",
                            amount: "\$1,760",
                            date: "12th June 2025",
                            subtitleColor: Colors.lightBlueAccent,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();
}
