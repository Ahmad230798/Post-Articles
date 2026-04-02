// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_project/core/constants/app_color.dart';
import 'package:flutter_project/core/constants/text_style.dart';

class Step2MediaUpload extends StatelessWidget {
  const Step2MediaUpload({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 32.h, horizontal: 20.w),
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Upload icon circle
          Container(
            width: 64.w,
            height: 64.w,
            decoration: BoxDecoration(
              color: AppColor.accent.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.cloud_upload,
              size: 36.sp,
              color: AppColor.accent,
            ),
          ),

          SizedBox(height: 16.h),

          // Title
          Text(
            "No content uploaded yet",
            style: AppTextStyle.font16boldgray.copyWith(
              fontSize: 18.sp,
              color: AppColor.textDark,
            ),
            textAlign: TextAlign.center,
          ),

          SizedBox(height: 6.h),

          // Subtitle
          SizedBox(
            width: 260.w,
            child: Text(
              "Upload your photos or videos to start your post. Support for JPG, PNG, and MP4.",
              style: AppTextStyle.font14regularGrey.copyWith(fontSize: 13.sp),
              textAlign: TextAlign.center,
            ),
          ),

          SizedBox(height: 20.h),

          // Upload button
          Container(
            height: 48.h,
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            decoration: BoxDecoration(
              color: AppColor.accent,
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: [
                BoxShadow(
                  color: AppColor.accent.withOpacity(0.2),
                  blurRadius: 8,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.add_a_photo, color: Colors.white, size: 20.sp),
                SizedBox(width: 8.w),
                Text(
                  "Upload Media",
                  style: AppTextStyle.font16boldgray.copyWith(
                    color: Colors.white,
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
