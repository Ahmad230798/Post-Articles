// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_project/core/constants/app_color.dart';
import 'package:flutter_project/core/constants/text_style.dart';

class EFRating extends StatelessWidget {
  const EFRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Customer Rating",
            style: AppTextStyle.font16boldgray.copyWith(
              color: AppColor.textDark,
            ),
          ),

          SizedBox(height: 16.h),

          Row(
            children: [
              _ratingButton(1),
              SizedBox(width: 8.w),
              _ratingButton(2),
              SizedBox(width: 8.w),
              _ratingButton(3),
              SizedBox(width: 8.w),
              _ratingButton(4, selected: true),
              SizedBox(width: 8.w),
              _ratingButton(5),
            ],
          ),
        ],
      ),
    );
  }

  Widget _ratingButton(int stars, {bool selected = false}) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            color: selected ? AppColor.accent : AppColor.grey.withOpacity(0.3),
            width: selected ? 2 : 1,
          ),
          color: selected
              ? AppColor.accent.withOpacity(0.05)
              : Colors.transparent,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              stars.toString(),
              style: AppTextStyle.font14regularGrey.copyWith(
                color: AppColor.textDark,
                fontWeight: selected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            SizedBox(width: 4.w),
            Icon(Icons.star, size: 14.sp, color: Colors.amber),
          ],
        ),
      ),
    );
  }
}
