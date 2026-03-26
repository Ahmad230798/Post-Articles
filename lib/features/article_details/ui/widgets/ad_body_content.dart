import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_project/core/constants/app_color.dart';
import 'package:flutter_project/core/constants/text_style.dart';

class ADBodyContent extends StatelessWidget {
  const ADBodyContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Paragraph 1
          Text(
            "As urban populations continue to surge, the demand for sustainable infrastructure has never been more critical. Traditional construction methods are being reimagined through the lens of ecological impact and long-term viability.",
            style: AppTextStyle.font14regularGrey.copyWith(
              color: AppColor.textDark,
              fontSize: 15.sp,
              height: 1.5,
            ),
          ),

          SizedBox(height: 12.h),

          // Paragraph 2
          Text(
            "Sustainable architecture is no longer just about adding a few solar panels or a green roof; it’s about a holistic approach to building design that considers everything from materials and energy efficiency to the health and well-being of the inhabitants.",
            style: AppTextStyle.font14regularGrey.copyWith(
              color: AppColor.textDark,
              fontSize: 15.sp,
              height: 1.5,
            ),
          ),

          SizedBox(height: 20.h),

          // Heading
          Text(
            "Key Principles of 2024 Design",
            style: AppTextStyle.font16boldgray.copyWith(
              color: AppColor.primary,
              fontSize: 20.sp,
            ),
          ),

          SizedBox(height: 12.h),

          // Bullet List
          _bullet("Biophilic design integration for mental wellness."),
          _bullet("Net-zero carbon emission during the construction phase."),
          _bullet("Adaptive reuse of existing concrete structures."),
        ],
      ),
    );
  }

  Widget _bullet(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "•  ",
            style: TextStyle(fontSize: 18.sp, color: AppColor.primary),
          ),
          Expanded(
            child: Text(
              text,
              style: AppTextStyle.font14regularGrey.copyWith(
                color: AppColor.textDark,
                fontSize: 15.sp,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
