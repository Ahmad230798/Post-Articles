// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_project/core/constants/app_color.dart';
import 'package:flutter_project/core/constants/text_style.dart';

class Step3AuthorInfo extends StatelessWidget {
  const Step3AuthorInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColor.accent.withOpacity(0.1)),
      ),
      child: Row(
        children: [
          // Avatar
          Container(
            width: 48.w,
            height: 48.w,
            decoration: BoxDecoration(
              color: AppColor.textDark,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.person, color: Colors.white),
          ),

          SizedBox(width: 12.w),

          // Name + Role
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Alex Rivers",
                style: AppTextStyle.font16boldgray.copyWith(
                  color: AppColor.textDark,
                ),
              ),
              Text(
                "Author & Photographer",
                style: AppTextStyle.font14regularGrey,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
