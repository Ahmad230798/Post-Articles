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
  final Color? borderColor;
  final TextStyle? textStyle;
  final Widget? widget;
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
    this.borderColor,
    this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        side: WidgetStatePropertyAll(
          BorderSide(color: borderColor ?? Colors.transparent, width: 1.sp),
        ),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          widget ?? SizedBox(),
          Text(buttonText, style: textStyle ?? AppTextStyle.font16boldwhite),
        ],
      ),
    );
  }
}
