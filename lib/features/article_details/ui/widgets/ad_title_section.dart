import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_project/core/constants/app_color.dart';
import 'package:flutter_project/core/constants/text_style.dart';

class ADTitleSection extends StatelessWidget {
  const ADTitleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Category Chip
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
            decoration: BoxDecoration(
              color: AppColor.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Text(
              "Architecture & Environment",
              style: AppTextStyle.font12regularWhite70.copyWith(
                color: AppColor.primary,
                fontWeight: FontWeight.bold,
                fontSize: 11.sp,
              ),
            ),
          ),

          SizedBox(height: 12.h),

          // Title
          Text(
            "The Future of Sustainable Architecture in Urban Centers",
            style: AppTextStyle.font20boldPrimary.copyWith(
              fontSize: 26.sp,
              height: 1.3,
            ),
          ),

          SizedBox(height: 16.h),
        ],
      ),
    );
  }
}
