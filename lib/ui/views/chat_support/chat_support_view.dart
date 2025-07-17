import 'package:edge_market/ui/common/app_colors.dart';
import 'package:edge_market/ui/widgets/common/background/background.dart';
import 'package:edge_market/ui/widgets/common/custom_text_field/custom_text_field.dart';
import 'package:edge_market/ui/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'chat_support_viewmodel.dart';

class ChatSupportView extends StackedView<ChatSupportViewModel> {
  const ChatSupportView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ChatSupportViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: kcBackgroundColor,
      appBar: AppBar(
        title:
            const Text("Chat Support", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Background(
        child: Column(
          children: [
            // Chat messages list
            Expanded(
              child: viewModel.isBusy
                  ? const MyLoading()
                  : ListView.builder(
                      reverse: true,
                      padding: const EdgeInsets.all(16.0),
                      itemCount: viewModel.messages.length,
                      itemBuilder: (context, index) {
                        final message = viewModel.messages[index];
                        final isMine =
                            message.senderId == viewModel.currentUserId;
                        return Align(
                          alignment: isMine
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 4),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: isMine
                                  ? kcPrimaryColor.withOpacity(0.8)
                                  : Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              message.message,
                              style: TextStyle(
                                color: isMine ? Colors.white : Colors.black,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomTextField(
                title: "Type a message...",
                controller: viewModel.messageController,
                prefix: const Icon(Icons.email_outlined, color: kcPrimaryColor),
                textClr: Colors.white,
                suffixIcon: IconButton(
                  icon: const Icon(Icons.send),
                  color: kcPrimaryColor,
                  onPressed: viewModel.sendMessage,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  ChatSupportViewModel viewModelBuilder(BuildContext context) =>
      ChatSupportViewModel();
}
