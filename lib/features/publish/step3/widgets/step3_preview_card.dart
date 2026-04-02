// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_project/core/constants/app_color.dart';
import 'package:flutter_project/core/constants/text_style.dart';

class Step3PreviewCard extends StatelessWidget {
  const Step3PreviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColor.accent.withOpacity(0.1)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Cover Image
          Container(
            height: 180.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.r),
                topRight: Radius.circular(16.r),
              ),
              image: const DecorationImage(
                image: NetworkImage(
                  "https://images.unsplash.com/photo-1501785888041-af3ef285b470",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Content
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title + Edit icon
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Draft Preview",
                          style: AppTextStyle.font14regularGrey.copyWith(
                            color: AppColor.accent,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          "Summer Expedition: Coastal Trails",
                          style: AppTextStyle.font16boldgray.copyWith(
                            fontSize: 20.sp,
                            color: AppColor.textDark,
                          ),
                        ),
                      ],
                    ),
                    Icon(Icons.edit_note, color: AppColor.accent, size: 28.sp),
                  ],
                ),

                SizedBox(height: 12.h),

                // Description
                Text(
                  "Journey through the rugged cliffs and serene beaches of the northern coastline. A complete guide to hidden coves.",
                  style: AppTextStyle.font14regularGrey.copyWith(
                    color: AppColor.textDark.withOpacity(0.8),
                  ),
                ),

                SizedBox(height: 12.h),

                // Location
                Row(
                  children: [
                    Icon(Icons.location_on, size: 16.sp, color: AppColor.grey),
                    SizedBox(width: 4.w),
                    Text(
                      "Oregon Coast, USA",
                      style: AppTextStyle.font14regularGrey.copyWith(
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
