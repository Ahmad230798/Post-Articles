import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_project/core/constants/app_color.dart';
import 'package:flutter_project/core/constants/text_style.dart';

class ADAuthorSection extends StatelessWidget {
  const ADAuthorSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          Row(
            children: [
              // Author Image
              Container(
                height: 48.h,
                width: 48.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.r),
                  border: Border.all(color: AppColor.primary.withOpacity(0.1)),
                  image: const DecorationImage(
                    image: AssetImage("assets/images/profile.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              SizedBox(width: 12.w),

              // Author Info
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Dr. Elena Richardson",
                    style: AppTextStyle.font16boldgray.copyWith(
                      color: AppColor.primary,
                      fontSize: 15.sp,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    "Senior Researcher • Oct 12, 2023 • 12 min read",
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
