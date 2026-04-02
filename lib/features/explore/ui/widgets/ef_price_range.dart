// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_project/core/constants/app_color.dart';
import 'package:flutter_project/core/constants/text_style.dart';

class EFPriceRange extends StatelessWidget {
  const EFPriceRange({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Price Range",
            style: AppTextStyle.font16boldgray.copyWith(
              color: AppColor.textDark,
            ),
          ),

          SizedBox(height: 24.h),

          // Slider Track
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Stack(
              clipBehavior: Clip.none, // مهم جداً حتى ما يقص الدائرة
              children: [
                // Background track
                Container(
                  height: 6.h,
                  decoration: BoxDecoration(
                    color: AppColor.grey.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),

                // Active range
                Positioned(
                  left: 60.w,
                  right: 120.w,
                  child: Container(
                    height: 6.h,
                    decoration: BoxDecoration(
                      color: AppColor.accent,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                ),

                // Left knob
                Positioned(
                  left: 60.w,
                  top: -(22.h / 2 - 6.h / 2), // الرفع الصحيح
                  child: _knob(),
                ),

                // Right knob
                Positioned(
                  right: 120.w,
                  top: -(22.h / 2 - 6.h / 2),
                  child: _knob(),
                ),
              ],
            ),
          ),

          SizedBox(height: 20.h),

          // Min / Max labels
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _priceLabel("Min Price", "\$50"),
                _priceLabel("Max Price", "\$250"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _knob() {
    return Container(
      height: 22.h,
      width: 22.h,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColor.accent, width: 2),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.15), blurRadius: 4),
        ],
      ),
    );
  }

  Widget _priceLabel(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyle.font12regularWhite70.copyWith(
            color: AppColor.grey,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          value,
          style: AppTextStyle.font16boldgray.copyWith(color: AppColor.textDark),
        ),
      ],
    );
  }
}
