// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_project/core/constants/app_color.dart';
import 'package:flutter_project/core/constants/text_style.dart';

class PWFooterButtons extends StatelessWidget {
  final String leftText;
  final String rightText;
  final VoidCallback? onLeftTap;
  final VoidCallback? onRightTap;

  const PWFooterButtons({
    super.key,
    required this.leftText,
    required this.rightText,
    this.onLeftTap,
    this.onRightTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: onLeftTap,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 14.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: AppColor.grey.withOpacity(0.3)),
                ),
                alignment: Alignment.center,
                child: Text(
                  leftText,
                  style: AppTextStyle.font16boldgray.copyWith(
                    color: AppColor.textDark,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: GestureDetector(
              onTap: onRightTap,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 14.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: AppColor.accent,
                ),
                alignment: Alignment.center,
                child: Text(
                  rightText,
                  style: AppTextStyle.font16boldgray.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
