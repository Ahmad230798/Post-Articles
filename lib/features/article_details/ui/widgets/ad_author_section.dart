// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_project/core/constants/app_color.dart';
import 'package:flutter_project/core/constants/text_style.dart';

class ADAuthorSection extends StatelessWidget {
  final String authorName;
  final int readTime;

  const ADAuthorSection({
    super.key,
    required this.authorName,
    required this.readTime,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 48.h,
                width: 48.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.r),
                  image: const DecorationImage(
                    image: AssetImage("assets/images/profile.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    authorName,
                    style: AppTextStyle.font16boldgray.copyWith(
                      color: AppColor.primary,
                      fontSize: 15.sp,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    "$readTime min read",
                    style: AppTextStyle.font12regularWhite70.copyWith(
                      color: AppColor.grey,
                      fontSize: 11.sp,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Divider(color: AppColor.primary.withOpacity(0.1)),
        ],
      ),
    );
  }
}
