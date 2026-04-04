// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_project/core/constants/app_color.dart';
import 'package:flutter_project/core/constants/text_style.dart';

class PWUploadBox extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String buttonText;

  const PWUploadBox({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: AppColor.accent.withOpacity(0.3),
          width: 2,
          style: BorderStyle.solid,
        ),
        color: AppColor.accent.withOpacity(0.05),
      ),
      child: Column(
        children: [
          Icon(icon, size: 40.sp, color: AppColor.accent),
          SizedBox(height: 12.h),
          Text(
            title,
            style: AppTextStyle.font16boldgray.copyWith(
              color: AppColor.textDark,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 6.h),
          Text(
            subtitle,
            style: AppTextStyle.font14regularGrey,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16.h),
          Container(
            padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 24.w),
            decoration: BoxDecoration(
              color: AppColor.accent,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Text(
              buttonText,
              style: AppTextStyle.font16boldgray.copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
