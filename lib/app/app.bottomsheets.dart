// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedBottomsheetGenerator
// **************************************************************************

import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';
import '../ui/bottom_sheets/notice/notice_sheet.dart';
import '../ui/bottom_sheets/payment_method/payment_method_sheet.dart';
import '../ui/bottom_sheets/withdraw/withdraw_sheet.dart';

enum BottomSheetType {
  notice,
  withdraw,
  paymentMethod,
}

void setupBottomSheetUi() {
  final bottomsheetService = locator<BottomSheetService>();

  final Map<BottomSheetType, SheetBuilder> builders = {
    BottomSheetType.notice: (context, request, completer) =>
        NoticeSheet(request: request, completer: completer),
    BottomSheetType.withdraw: (context, request, completer) =>
        WithdrawSheet(request: request, completer: completer),
    BottomSheetType.paymentMethod: (context, request, completer) =>
        PaymentMethodSheet(request: request, completer: completer),
  };

  bottomsheetService.setCustomSheetBuilders(builders);
}
