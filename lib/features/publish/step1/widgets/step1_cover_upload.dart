// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_project/core/constants/app_color.dart';
import 'package:flutter_project/core/constants/text_style.dart';

class Step1CoverUpload extends StatelessWidget {
  const Step1CoverUpload({super.key});

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
          Icon(Icons.add_photo_alternate, size: 40.sp, color: AppColor.accent),
          SizedBox(height: 12.h),
          Text(
            "Click to upload or drag and drop",
            style: AppTextStyle.font16boldgray.copyWith(
              color: AppColor.textDark,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 6.h),
          Text(
            "PNG, JPG, or WebP (max 5MB)",
            style: AppTextStyle.font14regularGrey,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
