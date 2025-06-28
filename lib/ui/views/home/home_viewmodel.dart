import 'package:edge_market/app/app.bottomsheets.dart';
import 'package:edge_market/app/app.locator.dart';
import 'package:edge_market/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  // final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();

  // void showDialog() {
  //   _dialogService.showCustomDialog(
  //     variant: DialogType.infoAlert,
  //     title: 'Stacked Rocks!',
  //     description: 'Give stacked $_counter stars on Github',
  //   );
  // }

  void showWithdrawBottomSheet() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.withdraw,
      title: ksHomeBottomSheetTitle,
      description: ksHomeBottomSheetDescription,
    );
  }
}
