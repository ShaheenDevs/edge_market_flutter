import 'package:flutter/material.dart';
import '../../../common/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? titleWidget;
  final Color? bgColor;
  final List<Widget>? actions;
  final bool leading;
  final bool? backNavigation;
  final bool? centerTitle;

  const CustomAppBar({
    super.key,
    required this.title,
    this.titleWidget,
    this.bgColor,
    this.actions,
    this.backNavigation = false,
    this.leading = false,
    this.centerTitle = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: backNavigation ?? false,
      centerTitle: centerTitle,
      backgroundColor: bgColor ?? kcBackgroundColor,
      leading: leading
          ? GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                padding: const EdgeInsets.only(bottom: 10, top: 8, left: 8),
                margin: const EdgeInsets.only(top: 10, bottom: 10, left: 15),
                decoration: BoxDecoration(
                    color: kcLightGrey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(15)),
                child: const Center(
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 20,
                    color: kcPrimaryColor,
                  ),
                ),
              ),
            )
          : null,
      title: titleWidget ??
          Text(
            title ?? '',
            style: const TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 24,
            ),
          ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
