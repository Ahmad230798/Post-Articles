import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_project/core/constants/app_color.dart';
import 'package:flutter_project/core/constants/text_style.dart';

class HomeHeroStory extends StatelessWidget {
  const HomeHeroStory({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16.w),
      height: 220.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        image: const DecorationImage(
          image: const AssetImage("assets/images/articles/article1.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              AppColor.primary.withOpacity(0.9),
              AppColor.primary.withOpacity(0.4),
              Colors.transparent,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Category Tag
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: AppColor.accent,
                borderRadius: BorderRadius.circular(4.r),
              ),
              child: Text("Breaking News", style: AppTextStyle.font10boldWhite),
            ),

            SizedBox(height: 8.h),

            // Title
            Text(
              "The Architecture of Tomorrow: How AI is Reshaping Urban Design",
              style: AppTextStyle.font20boldWhite,
            ),

            SizedBox(height: 8.h),

            // Info Row
            Row(
              children: [
                Icon(Icons.schedule, size: 14.sp, color: Colors.white70),
                SizedBox(width: 4.w),
                Text("12 min read", style: AppTextStyle.font12regularWhite70),
                SizedBox(width: 16.w),
                Icon(Icons.chat_bubble, size: 14.sp, color: AppColor.accent),
                SizedBox(width: 4.w),
                Text("42", style: AppTextStyle.font12regularWhite70),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
