import 'package:edge_market/models/payment.dart';
import 'package:flutter/material.dart';
import 'package:edge_market/ui/common/app_colors.dart';
import 'package:edge_market/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'payment_method_sheet_model.dart';

class PaymentMethodSheet extends StackedView<PaymentMethodSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const PaymentMethodSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    PaymentMethodSheetModel viewModel,
    Widget? child,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            request.title ?? 'Select Payment Method',
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
          ),
          if (request.description != null) ...[
            verticalSpaceTiny,
            Text(
              request.description ?? "",
              style: const TextStyle(fontSize: 14, color: kcMediumGrey),
              softWrap: true,
            ),
          ],
          verticalSpaceMedium,

          // 🧾 Show list of payment methods
          ...List.generate(
            (request.data ?? []).length,
            (index) {
              final PaymentMethod method = request.data[index];
              final accountName = method.accountName;
              final accountNumber = method.accountNumber;
              final accountOwner = method.accountOwner;

              return ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const Icon(Icons.account_balance_wallet_outlined,
                    color: kcPrimaryColor),
                title: Text(accountName),
                subtitle: Text('$accountNumber - $accountOwner'),
                onTap: () => completer?.call(SheetResponse(
                  confirmed: true,
                  data: method,
                )),
              );
            },
          ),

          verticalSpaceMedium,
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () => completer?.call(SheetResponse(confirmed: false)),
              child: const Text("Cancel", style: TextStyle(color: Colors.red)),
            ),
          ),
        ],
      ),
    );
  }

  @override
  PaymentMethodSheetModel viewModelBuilder(BuildContext context) =>
      PaymentMethodSheetModel();
}
