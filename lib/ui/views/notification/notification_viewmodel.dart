import 'package:edge_market/app/app.locator.dart';
import 'package:edge_market/models/notification.dart';
import 'package:edge_market/services/notification.dart';
import 'package:stacked/stacked.dart';
import 'package:url_launcher/url_launcher.dart';

class NotificationViewModel extends BaseViewModel {
  final _notificationService = locator<NotificationService>();

  List<Notification> notifications = [];

  Future<void> fetchNotifications() async {
    setBusy(true);
    notifications = await _notificationService.getNotifications();
    setBusy(false);
  }

  void openLink(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }
}
