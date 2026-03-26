import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_project/core/constants/app_color.dart';
import 'package:flutter_project/core/constants/text_style.dart';

class ADHeader extends StatelessWidget {
  const ADHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: AppColor.backgroundLight,
        border: Border(
          bottom: BorderSide(color: AppColor.primary.withOpacity(0.1)),
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
              alignment: Alignment.center,
              child: Icon(
                Icons.arrow_back,
                color: AppColor.primary,
                size: 24.sp,
              ),
            ),
          ),

          SizedBox(width: 8.w),

          // Title
          Expanded(
            child: Text(
              "Article Details",
              style: AppTextStyle.font20boldPrimary.copyWith(fontSize: 18.sp),
            ),
          ),

          // Share Button
          Container(
            height: 40.h,
            width: 40.h,
            decoration: BoxDecoration(
              color: AppColor.primary.withOpacity(0.05),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(Icons.share, color: AppColor.primary, size: 22.sp),
          ),

          SizedBox(width: 8.w),

          // More Button
          Container(
            height: 40.h,
            width: 40.h,
            decoration: BoxDecoration(
              color: AppColor.primary.withOpacity(0.05),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(Icons.more_vert, color: AppColor.primary, size: 22.sp),
          ),
        ],
      ),
    );
  }
}
