import 'package:edge_market/ui/common/ui_helpers.dart';
import 'package:edge_market/ui/widgets/common/custom_text_field/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'withdraw_viewmodel.dart';

class WithdrawView extends StackedView<WithdrawViewModel> {
  const WithdrawView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    WithdrawViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0B1F),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("Withdraw", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpaceSmall,
            const Text(
              "You need to wait for 20 days for next withdrawal",
              style: TextStyle(color: Colors.redAccent, fontSize: 12),
            ),
            verticalSpaceSmall,

            /// Amount Input
            const Text("Amount", style: TextStyle(color: Colors.white)),
            verticalSpaceSmall,
            CustomTextField(
              title: "Enter amount",
              suffixIcon: const Icon(Icons.attach_money),
              controller: viewModel.amountController,
              keyboardType: TextInputType.number,
            ),
            verticalSpaceSmall,

            /// Blockchain Dropdown
            const Text("Blockchain", style: TextStyle(color: Colors.white)),
            verticalSpaceSmall,
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF1E1E2E),
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: viewModel.selectedBlockchain,
                  isExpanded: true,
                  dropdownColor: const Color(0xFF1E1E2E),
                  icon: const Icon(Icons.keyboard_arrow_down,
                      color: Colors.white),
                  hint: const Row(
                    children: [
                      Icon(Icons.auto_graph, color: Colors.white70),
                      SizedBox(width: 8),
                      Text("Select blockchain",
                          style: TextStyle(color: Colors.white70)),
                    ],
                  ),
                  items: viewModel.blockchainOptions.map((chain) {
                    return DropdownMenuItem(
                      value: chain,
                      child: Text(chain,
                          style: const TextStyle(color: Colors.white)),
                    );
                  }).toList(),
                  onChanged: viewModel.setBlockchain,
                ),
              ),
            ),
            verticalSpaceSmall,

            /// Wallet Address
            const Text("Wallet address", style: TextStyle(color: Colors.white)),
            verticalSpaceSmall,
            CustomTextField(
              // title: "Wallet address",
              title: "e.g., 0xabc123... for BEP20",
              suffixIcon: const Icon(Icons.wallet),
              controller: viewModel.walletAddressController,
            ),
            const SizedBox(height: 20),

            /// Summary
            const Text("Withdrawal Summary",
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(
                "Amount Requested: \$${viewModel.parsedAmount.toStringAsFixed(0)}",
                style: const TextStyle(color: Colors.white70)),
            Text(
                "Platform Fee (20%): \$${viewModel.platformFee.toStringAsFixed(0)}",
                style: const TextStyle(color: Colors.redAccent)),
            Text(
                "Final Amount You'll Receive: ~\$${viewModel.finalAmount.toStringAsFixed(0)}",
                style: const TextStyle(color: Colors.lightGreenAccent)),

            const Spacer(),

            /// Request Button
            GestureDetector(
              onTap: viewModel.submitWithdraw,
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFEF476F), Color(0xFF5C9EFF)],
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.center,
                child: Text(
                  "Request \$${viewModel.finalAmount.toStringAsFixed(0)}",
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Center(
              child: Text(
                "Processing Time: 24 to 72 hours",
                style: TextStyle(color: Colors.redAccent, fontSize: 12),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  @override
  WithdrawViewModel viewModelBuilder(BuildContext context) =>
      WithdrawViewModel();
}
