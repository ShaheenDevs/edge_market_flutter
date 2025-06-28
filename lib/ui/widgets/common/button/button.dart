import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../../common/app_colors.dart';
import 'button_model.dart';

class Button extends StackedView<ButtonModel> {
  const Button({
    super.key,
    required this.onClick,
    required this.btnText,
    this.bgColor = kcPrimaryColor,
    this.borderRadius = 15,
    this.margin,
    this.outLineBorder = false,
    this.height,
    this.width,
    this.textColor,
    this.btnIcon,
    this.endIcon,
    this.btnStyle,
    this.useGradient = true,
  });

  final VoidCallback onClick;
  final Color? bgColor;
  final String btnText;
  final double borderRadius;
  final EdgeInsetsGeometry? margin;
  final bool? outLineBorder;
  final double? height;
  final double? width;
  final Color? textColor;
  final Widget? btnIcon;
  final Widget? endIcon;
  final TextStyle? btnStyle;
  final bool useGradient;

  @override
  Widget builder(
    BuildContext context,
    ButtonModel viewModel,
    Widget? child,
  ) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        height: height ?? 45,
        width: width ?? double.infinity,
        margin: margin,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: useGradient
              ? null
              : (outLineBorder == true ? Colors.transparent : bgColor),
          gradient: useGradient
              ? const LinearGradient(
                  colors: [kcPrimaryColor, kcScendryColor],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                )
              : null,
          border: outLineBorder == true
              ? Border.all(color: bgColor ?? kcVeryLightGrey)
              : null,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 0),
              blurRadius: 1,
              spreadRadius: 0,
              color: kcBlackColor.withOpacity(0.1),
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            btnIcon ?? const SizedBox(width: 24),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                btnText,
                textAlign: TextAlign.center,
                style: btnStyle ??
                    TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: textColor ?? Colors.white,
                    ),
              ),
            ),
            const SizedBox(width: 8),
            endIcon ?? const SizedBox(width: 24),
          ],
        ),
      ),
    );
  }

  @override
  ButtonModel viewModelBuilder(BuildContext context) => ButtonModel();
}
