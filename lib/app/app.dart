import 'package:edge_market/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:edge_market/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:edge_market/ui/views/home/home_view.dart';
import 'package:edge_market/ui/views/Auth/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:edge_market/ui/views/Auth/login/login_view.dart';
import 'package:edge_market/ui/views/Auth/signup/signup_view.dart';
import 'package:edge_market/ui/views/kyc/kyc_view.dart';
import 'package:edge_market/ui/views/upload_document/upload_document_view.dart';
import 'package:edge_market/ui/views/privacy_terms/privacy_terms_view.dart';
import 'package:edge_market/ui/bottom_sheets/withdraw/withdraw_sheet.dart';
import 'package:edge_market/ui/views/withdraw/withdraw_view.dart';
import 'package:edge_market/ui/views/leader_board/leader_board_view.dart';
import 'package:edge_market/ui/views/botton_bar/botton_bar_view.dart';
import 'package:edge_market/ui/views/my_network/my_network_view.dart';
import 'package:edge_market/ui/views/profile/profile_view.dart';
import 'package:edge_market/services/api_service.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: SignupView),
    MaterialRoute(page: KycView),
    MaterialRoute(page: UploadDocumentView),
    MaterialRoute(page: PrivacyTermsView),
    MaterialRoute(page: WithdrawView),
    MaterialRoute(page: LeaderBoardView),
    MaterialRoute(page: BottonBarView),
    MaterialRoute(page: MyNetworkView),
    MaterialRoute(page: ProfileView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: ApiService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    StackedBottomsheet(classType: WithdrawSheet),
// @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
