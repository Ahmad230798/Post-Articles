// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_project/features/home/models/article_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_project/core/constants/app_color.dart';
import 'package:flutter_project/core/constants/text_style.dart';

class HomeHeroStory extends StatelessWidget {
  final ArticleModel? article;

  const HomeHeroStory({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    if (article == null) {
      return const SizedBox.shrink();
    }

    return Container(
      margin: EdgeInsets.all(16.w),
      height: 220.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        image: DecorationImage(
          image: NetworkImage(article!.coverImage ?? ""),
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
            // Category
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: AppColor.accent,
                borderRadius: BorderRadius.circular(4.r),
              ),
              child: Text(
                article!.categoryName ?? "Category",
                style: AppTextStyle.font10boldWhite,
              ),
            ),

            SizedBox(height: 8.h),

            // Title
            Text(
              article!.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyle.font20boldWhite,
            ),

            SizedBox(height: 8.h),

            Row(
              children: [
                Icon(Icons.schedule, size: 14.sp, color: Colors.white70),
                SizedBox(width: 4.w),
                Text(
                  "${article!.readTime ?? 0} min read",
                  style: AppTextStyle.font12regularWhite70,
                ),
                SizedBox(width: 16.w),
                Icon(Icons.chat_bubble, size: 14.sp, color: AppColor.accent),
                SizedBox(width: 4.w),
                Text(
                  "${article!.commentsCount ?? 0}",
                  style: AppTextStyle.font12regularWhite70,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
