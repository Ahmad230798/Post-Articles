// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_project/core/constants/app_color.dart';
import 'package:flutter_project/core/constants/text_style.dart';

class EFSortBy extends StatelessWidget {
  const EFSortBy({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Sort By",
            style: AppTextStyle.font16boldgray.copyWith(
              color: AppColor.textDark,
            ),
          ),

          SizedBox(height: 16.h),

          _option("Most Relevant", selected: true),
          SizedBox(height: 12.h),
          _option("Newest Arrivals"),
          SizedBox(height: 12.h),
          _option("Price: High to Low"),
        ],
      ),
    );
  }

  Widget _option(String label, {bool selected = false}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(
          color: selected ? AppColor.accent : AppColor.grey.withOpacity(0.3),
        ),
        color: selected
            ? AppColor.accent.withOpacity(0.05)
            : Colors.transparent,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: AppTextStyle.font14regularGrey.copyWith(
              color: selected ? AppColor.textDark : AppColor.grey,
              fontWeight: selected ? FontWeight.bold : FontWeight.normal,
            ),
          ),

          // Radio circle
          Container(
            height: 20.h,
            width: 20.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: selected ? AppColor.accent : AppColor.grey,
                width: 2,
              ),
            ),
            child: selected
                ? Center(
                    child: Container(
                      height: 10.h,
                      width: 10.h,
                      decoration: BoxDecoration(
                        color: AppColor.accent,
                        shape: BoxShape.circle,
                      ),
                    ),
                  )
                : null,
          ),
        ],
      ),
    );
  }
}
