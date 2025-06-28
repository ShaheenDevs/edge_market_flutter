import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'withdraw_sheet_model.dart';

class WithdrawSheet extends StackedView<WithdrawSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const WithdrawSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    WithdrawSheetModel viewModel,
    Widget? child,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E2E),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Withdraw to",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 20),
          _optionTile(
            context,
            icon: Icons.currency_bitcoin,
            title: "Crypto Wallet",
            subtitle: "Send to a crypto address.",
            method: WithdrawMethod.crypto,
            selectedMethod: viewModel.selectedMethod,
            onChanged: viewModel.onChanged,
            iconColor: Colors.yellowAccent,
          ),
          const SizedBox(height: 12),
          _optionTile(
            context,
            icon: Icons.account_balance,
            title: "Bank Transfer",
            subtitle: "Withdraw in fiat currency",
            method: WithdrawMethod.bank,
            selectedMethod: viewModel.selectedMethod,
            onChanged: viewModel.onChanged,
            iconColor: Colors.lightBlueAccent,
          ),
        ],
      ),
    );
  }

  @override
  WithdrawSheetModel viewModelBuilder(BuildContext context) =>
      WithdrawSheetModel();

  Widget _optionTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required WithdrawMethod method,
    required WithdrawMethod selectedMethod,
    required Function(WithdrawMethod) onChanged,
    required Color iconColor,
  }) {
    return InkWell(
      onTap: () => onChanged(method),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.white10,
            child: Icon(icon, color: iconColor),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(subtitle,
                    style:
                        const TextStyle(color: Colors.white54, fontSize: 12)),
              ],
            ),
          ),
          Radio<WithdrawMethod>(
            value: method,
            groupValue: selectedMethod,
            onChanged: (val) => onChanged(val!),
            activeColor: Colors.pinkAccent,
          ),
        ],
      ),
    );
  }
}
