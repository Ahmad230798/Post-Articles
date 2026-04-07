// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_project/core/constants/app_color.dart';
import 'package:flutter_project/core/constants/text_style.dart';

class EFApplyButton extends StatelessWidget {
  final VoidCallback? onApply;

  const EFApplyButton({super.key, this.onApply});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.85),
          border: Border(
            top: BorderSide(color: AppColor.grey.withOpacity(0.2)),
          ),
        ),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.accent,
              padding: EdgeInsets.symmetric(vertical: 14.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14.r),
              ),
            ),
            onPressed: onApply,
            child: Text(
              "Apply Filters",
              style: AppTextStyle.font16boldgray.copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
