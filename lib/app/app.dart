import 'package:edge_market/services/notification.dart';
import 'package:edge_market/services/payments_service.dart';
import 'package:edge_market/services/referral_service.dart';
import 'package:edge_market/services/wallet.dart';
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
import 'package:edge_market/services/auth_service.dart';
import 'package:edge_market/services/leaderboard_service.dart';
import 'package:edge_market/services/kyc_service.dart';
import 'package:edge_market/ui/views/notification/notification_view.dart';
import 'package:edge_market/ui/bottom_sheets/payment_method/payment_method_sheet.dart';
import 'package:edge_market/ui/views/kyc_pending/kyc_pending_view.dart';
import 'package:edge_market/ui/views/kyc_rejected/kyc_rejected_view.dart';
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
    MaterialRoute(page: NotificationView),
    MaterialRoute(page: KycPendingView),
    MaterialRoute(page: KycRejectedView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: ApiService),
    LazySingleton(classType: AuthService),
    LazySingleton(classType: LeaderboardService),
    LazySingleton(classType: KycService),
    LazySingleton(classType: ReferralService),
    LazySingleton(classType: NotificationService),
    LazySingleton(classType: WalletService),
    LazySingleton(classType: PaymentMethodService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    StackedBottomsheet(classType: WithdrawSheet),
    StackedBottomsheet(classType: PaymentMethodSheet),
// @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
