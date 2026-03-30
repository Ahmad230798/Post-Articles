import 'package:flutter/material.dart';
import 'package:flutter_project/core/constants/app_color.dart';
import 'package:flutter_project/core/constants/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextButton extends StatelessWidget {
  final double? borderRadius;
  final Color? backgroundcolor;
  final double? verticalPadaing;
  final double? horizontalPadaing;
  final double? buttonWidth;
  final double? buttonHight;
  final VoidCallback? onPressed;
  final String buttonText;
  final TextStyle? textStyle;
  const AppTextButton({
    super.key,
    this.borderRadius,
    this.backgroundcolor,
    this.verticalPadaing,
    this.horizontalPadaing,
    this.buttonWidth,
    this.buttonHight,
    this.onPressed,
    required this.buttonText,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(borderRadius ?? 8.r),
          ),
        ),
        backgroundColor: WidgetStatePropertyAll(
          backgroundcolor ?? AppColor.green,
        ),
        padding: WidgetStatePropertyAll<EdgeInsets>(
          EdgeInsets.symmetric(
            vertical: verticalPadaing ?? 14.h,
            horizontal: horizontalPadaing ?? 115,
          ),
        ),
        fixedSize: WidgetStatePropertyAll(
          Size(buttonWidth?.w ?? double.maxFinite, buttonHight ?? 52.h),
        ),
      ),

      onPressed: onPressed,
      child: Text(buttonText, style: textStyle ?? AppTextStyle.font16boldwhite),
    );
  }
}
