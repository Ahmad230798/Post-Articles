import 'package:flutter/material.dart';
import 'package:flutter_project/core/constants/app_color.dart';
import 'package:flutter_project/core/constants/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ADRatingSection extends StatelessWidget {
  final String rating;

  const ADRatingSection({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Row(
        children: [
          Icon(Icons.star, color: Colors.amber, size: 24.sp),
          SizedBox(width: 6.w),
          Text(
            rating.isEmpty ? "0" : rating,
            style: AppTextStyle.font16boldgray.copyWith(
              color: AppColor.primary,
              fontSize: 18.sp,
            ),
          ),
        ],
      ),
    );
  }
}
