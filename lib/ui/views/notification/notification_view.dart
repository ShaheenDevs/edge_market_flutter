import 'package:edge_market/models/notification.dart';
import 'package:edge_market/ui/common/app_colors.dart';
import 'package:edge_market/ui/widgets/common/background/background.dart';
import 'package:edge_market/ui/widgets/loading.dart';
import 'package:flutter/material.dart' hide Notification;
import 'package:stacked/stacked.dart';
import 'notification_viewmodel.dart';

class NotificationView extends StackedView<NotificationViewModel> {
  const NotificationView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    NotificationViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: kcBackgroundColor,
      appBar: AppBar(
        title:
            const Text('Notifications', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: viewModel.isBusy
          ? const MyLoading()
          : Background(
              child: RefreshIndicator(
                onRefresh: viewModel.fetchNotifications,
                child: viewModel.notifications.isEmpty
                    ? const Center(child: Text("No notifications found"))
                    : ListView.separated(
                        padding: const EdgeInsets.all(16),
                        itemCount: viewModel.notifications.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 12),
                        itemBuilder: (context, index) {
                          final Notification notification =
                              viewModel.notifications[index];
                          return Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: const Color(0xFF252728),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  notification.title,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                ),
                                const SizedBox(height: 4),
                                Text(notification.description,
                                    style:
                                        const TextStyle(color: Colors.white)),
                                // if (notification.link != null &&
                                //     notification.link!.isNotEmpty)
                                //   Padding(
                                //     padding: const EdgeInsets.only(top: 6.0),
                                //     child: GestureDetector(
                                //       onTap: () => viewModel
                                //           .openLink(notification.link!),
                                //       child: Text(
                                //         notification.link!,
                                //         style: const TextStyle(
                                //           color: Colors.blue,
                                //           decoration: TextDecoration.underline,
                                //         ),
                                //       ),
                                //     ),
                                //   ),
                              ],
                            ),
                          );
                        },
                      ),
              ),
            ),
    );
  }

  @override
  NotificationViewModel viewModelBuilder(BuildContext context) =>
      NotificationViewModel();

  @override
  void onViewModelReady(NotificationViewModel viewModel) {
    viewModel.fetchNotifications();
  }
}
