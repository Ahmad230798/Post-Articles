// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_project/core/constants/app_color.dart';
import 'package:flutter_project/core/constants/text_style.dart';

class EFHeader extends StatelessWidget {
  const EFHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: AppColor.backgroundLight,
        border: Border(
          bottom: BorderSide(color: AppColor.grey.withOpacity(0.15)),
        ),
      ),
      child: Row(
        children: [
          // Back Button
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              height: 40.h,
              width: 40.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.r),
              ),
              alignment: Alignment.center,
              child: Icon(
                Icons.arrow_back,
                size: 22.sp,
                color: AppColor.textDark,
              ),
            ),
          ),

          // Title
          Expanded(
            child: Text(
              "Filters",
              textAlign: TextAlign.center,
              style: AppTextStyle.font16boldgray.copyWith(
                fontSize: 18.sp,
                color: AppColor.textDark,
              ),
            ),
          ),

          // Reset Button
          GestureDetector(
            onTap: () {
              // TODO: Reset filters logic
            },
            child: Text(
              "Reset",
              style: AppTextStyle.font14regularGrey.copyWith(
                color: AppColor.accent,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
